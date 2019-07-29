# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#

class Response < ApplicationRecord
  # validates :user_id, :answer_choice_id, presence: true
  validate :not_duplicate_response

  def not_duplicate_response
    if respondent_already_answered?
      errors[:answer_choice] << "Can't answer the same question twice"
    end
  end

  belongs_to :respondent,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    siblings = self.sibling_responses
    siblings.exists?(user_id: self.user_id)
  end

end

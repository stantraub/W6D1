# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
  User.delete_all
  Poll.delete_all
  Question.delete_all
  AnswerChoice.delete_all
  Response.delete_all
  
  #Seed users
  user_1 = User.create!(username: 'abc')
  user_2 = User.create!(username: 'def')
  user_3 = User.create!(username: 'ghi')
  user_4 = User.create!(username: 'jkl')
  user_5 = User.create!(username: 'mno')


  #Seed polls
  poll_1 = Poll.create!(title: 'ABC', user_id: user_1.id)
  poll_2 = Poll.create!(title: 'DEF', user_id: user_2.id)


  #Seed questions
  q_1 = Question.create!(text: 'How long is the assessment?', poll_id: poll_1.id)
  q_2 = Question.create!(text: 'Is the assessment hard?', poll_id: poll_1.id)
  q_3 = Question.create!(text: 'What is the assessment on?', poll_id: poll_2.id)
  q_4 = Question.create!(text: 'When will this be over?', poll_id: poll_2.id)


  #Seed answerchoices
  a_1 = AnswerChoice.create!(text: '45min', question_id: q_1.id)
  a_2 = AnswerChoice.create!(text: '75min', question_id: q_1.id)

  #Seed responses
  r_1 = Response.create!(user_id: user_3.id, answer_choice_id: a_1.id)
  r_2 = Response.create!(user_id: user_4.id, answer_choice_id: a_2.id)

end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Result.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all

categories = Category.create!([{ category: 'Programming skills' }, { category: 'Speaking skills' },
                               { category: 'Math skills' }])
users = User.create!([{ name: 'George' }, { name: 'Masha' }, { name: 'Vika' }])

tests = Test.create!([{ title: 'Ruby', level: 2, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'HTML', level: 3, category_id: categories[0].id, author_id: users[0].id },
                      { title: 'Rails', level: 1, category_id: categories[0].id, author_id: users[0].id }])

questions = Question.create!([{ body: 'Ru1?', test_id: tests[0].id },
                              { body: 'Ru2?', test_id: tests[0].id },
                              { body: 'Ru3?', test_id: tests[0].id },
                              { body: 'Ht1?', test_id: tests[1].id },
                              { body: 'Ht2?', test_id: tests[1].id },
                              { body: 'Ra1?', test_id: tests[2].id },
                              { body: 'Ra2?', test_id: tests[2].id }])

answers = Answer.create!([{ body: 'A.Ru1', correct: true, question_id: questions[0].id },
                          { body: 'A.Ru2', correct: true, question_id: questions[0].id },
                          { body: 'A.Ru3', correct: true, question_id: questions[0].id },
                          { body: 'A.Ht1', correct: true, question_id: questions[1].id },
                          { body: 'A.Ht2', correct: true, question_id: questions[1].id },
                          { body: 'A.Ru1', correct: true, question_id: questions[2].id },
                          { body: 'A.Ru2', correct: true, question_id: questions[2].id }])

Result.create!(user_id: users[0].id, test_id: tests[0].id)
Result.create!(user_id: users[0].id, test_id: tests[1].id)
Result.create!(user_id: users[0].id, test_id: tests[2].id)

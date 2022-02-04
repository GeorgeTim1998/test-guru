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

tests = Test.create!([{ title: 'Ruby', level: 2, category: categories[0], author: users[0] },
                      { title: 'HTML', level: 3, category: categories[0], author: users[0] },
                      { title: 'Rails', level: 1, category: categories[0], author: users[0] }])

questions = Question.create!([{ body: 'Ru1?', test: tests[0] },
                              { body: 'Ru2?', test: tests[0] },
                              { body: 'Ru3?', test: tests[0] },
                              { body: 'Ht1?', test: tests[1] },
                              { body: 'Ht2?', test: tests[1] },
                              { body: 'Ra1?', test: tests[2] },
                              { body: 'Ra2?', test: tests[2] }])

Answer.create!([{ body: 'A.Ru1', correct: true, question: questions[0] },
                { body: 'A.Ru2', correct: true, question: questions[0] },
                { body: 'A.Ru3', correct: true, question: questions[0] },
                { body: 'A.Ht1', correct: true, question: questions[1] },
                { body: 'A.Ht2', correct: true, question: questions[1] },
                { body: 'A.Ru1', correct: true, question: questions[2] },
                { body: 'A.Ru2', correct: true, question: questions[2] }])

Result.create!(user: users[0], test: tests[0])
Result.create!(user: users[0], test: tests[1])
Result.create!(user: users[0], test: tests[2])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ category: 'Programming skills' }, { category: 'Speaking skills' },
                               { category: 'Math skills' }])
users = User.create!([{ name: 'George' }, { name: 'Masha' }, { name: 'Vika' }])

test = Test.create!(title: 'Ruby', level: 2, category_id: categories[0].id, author_id: users[0].id)
Test.create!(title: 'HTML', level: 3, category_id: categories[0].id, author_id: users[0].id)
Test.create!(title: 'Rails', level: 1, category_id: categories[0].id, author_id: users[0].id)

question = Question.create!(body: 'What is a class?', test_id: test.id)
Question.create!(body: 'what is an object?', test_id: test.id)
Question.create!(body: 'What is an instance method?', test_id: test.id)

Answer.create!(body: 'A class is written by a programmer in a defined structure to create an object.',
               correct: true, question_id: question.id)
Answer.create!(body: 'Object is a variable, a data structure, a function, or a method.', correct: true,
               question_id: question.id)
Answer.create!(body: 'Methods which require an object of its class to be created before it can be called.',
               correct: true, question_id: question.id)

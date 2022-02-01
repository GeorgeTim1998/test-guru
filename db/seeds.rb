# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{ id: 1, category: 'Programming skills' }, { id: 2, category: 'Speaking skills' },
                 { id: 3, category: 'Math skills' }])
User.create([{ id: 1, name: 'George' }, { id: 2, name: 'Masha' }, { id: 3, name: 'Vika' }])

Test.create(id: 1, title: 'Ruby', level: 2, category_id: 1, author_id: 1)
Test.create(id: 2, title: 'HTML', level: 3, category_id: 1, author_id: 1)
Test.create(id: 3, title: 'Rails', level: 1, category_id: 1, author_id: 1)

Question.create(id: 1, body: 'What is a class?', test_id: 1)
Question.create(id: 2, body: 'what is an object?', test_id: 1)
Question.create(id: 3, body: 'What is an instance method?', test_id: 1)

Answer.create(id: 1, body: 'A class is written by a programmer in a defined structure to create an object.',
              correct: true, question_id: 1)
Answer.create(id: 2, body: 'Object is a variable, a data structure, a function, or a method.', correct: true,
              question_id: 1)
Answer.create(id: 3, body: 'Methods which require an object of its class to be created before it can be called.',
              correct: true, question_id: 1)

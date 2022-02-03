class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  # has_many :author_tests, class_name: 'Test', inverse_of: 'author' foreign key!

  def tests_of_difficulty(level)
    Test.joins(:results)
        .where(level: level, results: { user_id: id })
  end
end

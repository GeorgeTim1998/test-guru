class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', inverse_of: 'author', foreign_key: 'author_id'

  validates :name, presence: true
  validates :email, presence: true

  def tests_of_difficulty(level)
    tests.where(level: level)
  end
end

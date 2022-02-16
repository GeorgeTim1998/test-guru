require 'digest/sha1'

class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', inverse_of: 'author', foreign_key: 'author_id'

  validates :email, presence: true

  has_secure_password

  def tests_by_difficulty(level)
    tests.results_by_level(self, level)
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end

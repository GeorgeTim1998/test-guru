class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', inverse_of: 'author', foreign_key: 'author_id'

  validates :email, presence: true

  def tests_by_difficulty(level)
    Test.results_by_level(self, level)
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', inverse_of: 'author', foreign_key: 'author_id'
  has_many :gists, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :type, presence: true, inclusion: { in: %w[User Admin] }
  validates_format_of :email, with: /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/i

  def tests_by_difficulty(level)
    tests.results_by_level(self, level)
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end

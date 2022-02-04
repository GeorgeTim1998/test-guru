class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: 'created_tests'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true
  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_then: 0 }

  scope :by_level, ->(level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }
  scope :results_by_level, ->(user, level) { joins(:results).by_level(level).where(results: { user: user }) }
  scope :by_category, ->(name) { joins(:category).where(categories: { name: name }).order(title: :desc) }

  def self.test_name_desc_by_category(name)
    by_category(name)
      .pluck(:title)
  end
end

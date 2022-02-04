class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: 'created_tests'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  scope :easy_level_tests, -> { where(level: 0..1) }
  scope :medium_level_tests, -> { where(level: 2..4) }
  scope :hard_level_tests, -> { where(level: 5..Float::INFINITY) }

  def self.test_name_desc_by_category(name)
    joins(:category)
      .where(categories: { name: name })
      .order(title: :desc)
      .pluck(:title)
  end
end

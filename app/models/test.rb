class Test < ApplicationRecord
  belongs_to :category
  # belongs_to :author, class_name: 'User', inverse_of: 'author_tests'

  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.test_name_desc_by_category(name)
    joins(:category)
      .where(categories: { name: name })
      .order(title: :desc)
      .pluck(:title)
  end
end

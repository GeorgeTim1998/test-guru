class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', inverse_of: 'tests'

  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  def self.test_name_desc_by_category(name)
    joins(:category)
      .where(categories: { name: name })
      .order(title: :desc)
      .pluck(:title)
  end
end

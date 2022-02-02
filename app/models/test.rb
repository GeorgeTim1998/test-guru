class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results
  def self.test_name_desc_by_category(name)
    joins('JOIN categories ON categories.id = category_id')
      .where(categories: { name: name })
      .order(title: :desc)
      .pluck(:title)
  end
end

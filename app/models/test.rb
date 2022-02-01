class Test < ApplicationRecord
  def self.test_name_desc_by_category(category)
    category_id = Category.where(category: category).pluck(:id)
    Test.where(category_id: category_id).order(title: :desc).pluck(:title)
  end
end

class Test < ApplicationRecord
  def self.test_name_desc_by_category(category)
    Test.joins('JOIN categories ON categories.id = category_id').where('categories.category = ?',
                                                                       category).order(title: :desc).pluck(:title)
  end
end

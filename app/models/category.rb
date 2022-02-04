class Category < ApplicationRecord
  default_scope { order(:name) }

  has_many :tests, dependent: :destroy
end

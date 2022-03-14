class Badge < ApplicationRecord
  has_many :issued_badges, dependent: :destroy
  has_many :users, through: :issued_badges

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :rule, presence: true
  validates :image_url, presence: true
end

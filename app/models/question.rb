class Question < ApplicationRecord
  belongs_to :tests

  has_many :answers, dependent: :destroy
end

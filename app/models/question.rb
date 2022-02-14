class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :nullify, inverse_of: 'current_question', foreign_key: 'current_question_id'

  validates :body, presence: true
end

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    errors.add(:base, 'Amount of answers must be 1..4') if question.answers.count > 4
  end
end

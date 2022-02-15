class Result < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: %i[create update]

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def successful?
    successful_rate >= SUCCESS_RATIO
  end

  def successful_rate
    100 * correct_questions.to_f / test.questions.count
  end

  private

  def before_validation_set_current_question
    self.current_question = next_question
    self.current_question_number += 1
  end

  def next_question
    if self.current_question_number.zero?
      test.questions.first if test.present?
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    if answer_ids.nil?
      false
    else
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def correct_answers
    current_question.answers.correct
  end
end

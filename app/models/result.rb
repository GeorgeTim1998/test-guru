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
    current_question.nil? || timer_ended?
  end

  def successful?
    successful_rate >= SUCCESS_RATIO
  end

  def successful_rate
    (100 * correct_questions.to_f / test.questions.count).round(1)
  end

  def progress_rate
    (100 * (current_question_number - 1).to_f / test.questions.count).round(0)
  end

  private

  def timer_ended?
    time_elapsed = ((Time.now - created_at) / 60).to_i
    (time_elapsed - test.time_limit).positive?
  end

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
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end

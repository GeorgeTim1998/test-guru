class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def successful?
    percentage_of_passing >= 85
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
    self.current_question_number = 1
  end

  def before_validation_set_next_question
    self.current_question = next_question
    self.current_question_number += 1
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end
end

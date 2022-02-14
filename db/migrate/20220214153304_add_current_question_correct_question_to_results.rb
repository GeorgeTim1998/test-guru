class AddCurrentQuestionCorrectQuestionToResults < ActiveRecord::Migration[6.0]
  def change
    add_reference :results, :current_question, foreign_key: { to_table: :questions }
    add_column :results, :current_question_number, :integer, default: 0
    add_column :results, :correct_questions, :integer, default: 0
  end
end

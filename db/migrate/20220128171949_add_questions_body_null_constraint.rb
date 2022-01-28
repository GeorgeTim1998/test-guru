class AddQuestionsBodyNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:questions, :body, true)
  end
end

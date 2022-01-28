class AddAnswerTestIdNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :test_id, false)
  end
end

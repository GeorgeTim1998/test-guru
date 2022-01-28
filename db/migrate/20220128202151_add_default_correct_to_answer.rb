class AddDefaultCorrectToAnswer < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:answers, :correct, '1')
  end
end

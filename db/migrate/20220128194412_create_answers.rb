class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.integer :test_id, null: false
      t.string :correct, null: false, from: nil, to: '1'

      t.timestamps
    end
  end
end

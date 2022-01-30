class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false, from: nil, to: 1
      t.integer :level, null: false

      t.timestamps
    end
  end
end

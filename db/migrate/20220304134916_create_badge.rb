class CreateBadge < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :description
      t.string :rule, null: false
      t.string :achievement
      t.string :image_url, null: false
    end
  end
end

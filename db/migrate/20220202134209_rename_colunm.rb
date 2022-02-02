class RenameColunm < ActiveRecord::Migration[6.0]
  def up
    rename_column :categories, :category, :name
  end

  def down
    rename_column :categories, :name, :category
  end
end

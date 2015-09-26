class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string "category_title"

      t.timestamps null: false
    end
    add_index("categories", "category_title")
  end

  def down
    drop_table :categories
  end
end

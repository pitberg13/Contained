class CreateEventCategories < ActiveRecord::Migration
  def up
    create_table :event_categories do |t|
      t.references :event
      t.references :category

      t.timestamps null: false
    end
    add_index :event_categories, ["event_id", "category_id"]
  end

  def down
    drop_table :event_categories
  end
end

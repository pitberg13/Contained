class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.integer "venue_id"
      t.integer "category_id"
      t.string "title"
      t.string "permalink"
      t.integer "ticket_price"
      t.datetime "event_datetime"
      t.string "content"
      t.string "image"
      t.boolean "visible"
      t.boolean "featured"
      t.integer "position"

      t.timestamps null: false
    end
    add_index("events", "title")
    add_index("events", "permalink")
    add_index("events", "venue_id")
    add_index("events", "category_id")
  end

  def down
    drop_table :events
  end
end

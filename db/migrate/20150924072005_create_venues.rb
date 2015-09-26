class CreateVenues < ActiveRecord::Migration
  def up
    create_table :venues do |t|
      t.string "venue_name"

      t.timestamps null: false
    end
    add_index("venues", "venue_name")
  end

  def down
    drop_table :venues
  end
end

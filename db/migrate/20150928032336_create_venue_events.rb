class CreateVenueEvents < ActiveRecord::Migration
  def up
    create_table :venue_events do |t|
      t.references :event
      t.references :venue

      t.timestamps null: false
    end
    add_index :venue_events, ["event_id", "venue_id"]
  end

  def down
    drop_table :venue_events
  end
end

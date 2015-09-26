 class CreateEventEdits < ActiveRecord::Migration

  def up
    create_table :event_edits do |t|
      t.references :admin_user
      t.references :event
      t.string :summary
      t.timestamps
    end
    add_index :event_edits, ["admin_user_id", "event_id"]
  end

  def down
    drop_table :event_edits
  end

end

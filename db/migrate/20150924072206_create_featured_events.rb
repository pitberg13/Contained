class CreateFeaturedEvents < ActiveRecord::Migration
  def change
    create_table :featured_events do |t|

      t.timestamps null: false
    end
  end
end

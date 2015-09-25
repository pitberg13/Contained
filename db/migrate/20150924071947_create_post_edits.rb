class CreatePostEdits < ActiveRecord::Migration
  def up
    create_table :post_edits do |t|
      t.references :admin_user
      t.references :post
      t.string :summary

      t.timestamps null: false
    end
    add_index :post_edits, ["admin_user_id", "post_id"]
  end

  def down
    drop_table :post_edits
  end

end

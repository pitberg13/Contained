class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string "title"
      t.string "permalink"
      t.string "content"
      t.string "image"
      t.boolean "published"
      t.boolean "featured"
      t.integer "position"

      t.timestamps null: false
    end
    add_index("posts", "title")
    add_index("posts", "permalink")
  end

  def down
    drop_table :posts
  end

end

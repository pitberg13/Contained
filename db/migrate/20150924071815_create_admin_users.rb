class CreateAdminUsers < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
      t.string "username", :limit => 12
      t.string "first_name", :limit => 25
      t.string "last_name", :limit => 25
      t.string "email"
      t.string "password_digest"
      t.timestamps null: false
    end
    add_index("admin_users", "username")
  end

  def down
    drop_table :admin_users
  end
end

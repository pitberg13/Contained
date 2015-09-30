# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150929191246) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "username",        limit: 12
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 25
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "admin_users", ["username"], name: "index_admin_users_on_username", using: :btree

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id",   limit: 4
    t.string   "bootsy_resource_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file",       limit: 255
    t.integer  "image_gallery_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_title", limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "categories", ["category_title"], name: "index_categories_on_category_title", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "event_categories", force: :cascade do |t|
    t.integer  "event_id",    limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "event_categories", ["event_id", "category_id"], name: "index_event_categories_on_event_id_and_category_id", using: :btree

  create_table "event_edits", force: :cascade do |t|
    t.integer  "admin_user_id", limit: 4
    t.integer  "event_id",      limit: 4
    t.string   "summary",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_edits", ["admin_user_id", "event_id"], name: "index_event_edits_on_admin_user_id_and_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "venue_id",             limit: 4
    t.integer  "category_id",          limit: 4
    t.string   "title",                limit: 255
    t.string   "permalink",            limit: 255
    t.integer  "ticket_price",         limit: 4
    t.datetime "event_datetime"
    t.text     "content",              limit: 65535
    t.string   "image",                limit: 255
    t.boolean  "visible"
    t.boolean  "featured"
    t.integer  "position",             limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "uploads_file_name",    limit: 255
    t.string   "uploads_content_type", limit: 255
    t.integer  "uploads_file_size",    limit: 4
    t.datetime "uploads_updated_at"
  end

  add_index "events", ["category_id"], name: "index_events_on_category_id", using: :btree
  add_index "events", ["permalink"], name: "index_events_on_permalink", using: :btree
  add_index "events", ["title"], name: "index_events_on_title", using: :btree
  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "alt",               limit: 255, default: ""
    t.string   "hint",              limit: 255, default: ""
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size",    limit: 4
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mercury_images", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_edits", force: :cascade do |t|
    t.integer  "admin_user_id", limit: 4
    t.integer  "post_id",       limit: 4
    t.string   "summary",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "post_edits", ["admin_user_id", "post_id"], name: "index_post_edits_on_admin_user_id_and_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",                limit: 255
    t.string   "permalink",            limit: 255
    t.text     "content",              limit: 65535
    t.string   "image",                limit: 255
    t.boolean  "published"
    t.boolean  "featured"
    t.integer  "position",             limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "uploads_file_name",    limit: 255
    t.string   "uploads_content_type", limit: 255
    t.integer  "uploads_file_size",    limit: 4
    t.datetime "uploads_updated_at"
  end

  add_index "posts", ["permalink"], name: "index_posts_on_permalink", using: :btree
  add_index "posts", ["title"], name: "index_posts_on_title", using: :btree

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "rich_rich_files", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rich_file_file_name",    limit: 255
    t.string   "rich_file_content_type", limit: 255
    t.integer  "rich_file_file_size",    limit: 4
    t.datetime "rich_file_updated_at"
    t.string   "owner_type",             limit: 255
    t.integer  "owner_id",               limit: 4
    t.text     "uri_cache",              limit: 65535
    t.string   "simplified_type",        limit: 255,   default: "file"
  end

  create_table "venue_events", force: :cascade do |t|
    t.integer  "event_id",   limit: 4
    t.integer  "venue_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "venue_events", ["event_id", "venue_id"], name: "index_venue_events_on_event_id_and_venue_id", using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "venue_name", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "venues", ["venue_name"], name: "index_venues_on_venue_name", using: :btree

end

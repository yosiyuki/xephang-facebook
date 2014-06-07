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

ActiveRecord::Schema.define(version: 20140607131831) do

  create_table "likes", force: true do |t|
    t.integer  "page_id",    null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["page_id"], name: "index_likes_on_page_id"

  create_table "pages", force: true do |t|
    t.string   "uid",        null: false
    t.string   "url",        null: false
    t.string   "name",       null: false
    t.text     "json",       null: false
    t.integer  "last_likes"
    t.integer  "prev_likes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["last_likes"], name: "index_pages_on_last_likes"
  add_index "pages", ["uid"], name: "index_pages_on_uid"
  add_index "pages", ["url"], name: "index_pages_on_url"

end

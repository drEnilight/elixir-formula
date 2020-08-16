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

ActiveRecord::Schema.define(version: 2020_08_16_142847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "publications", force: :cascade do |t|
    t.string "title", null: false
    t.string "url", null: false
    t.text "tags", default: [], array: true
    t.string "language", null: false
    t.string "author_name"
    t.string "status", default: "pending", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "source"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "image", null: false
    t.string "nickname", null: false
    t.string "location"
    t.boolean "admin", default: false, null: false
  end

end

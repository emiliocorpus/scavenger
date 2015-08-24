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

ActiveRecord::Schema.define(version: 20150822193151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clues", force: :cascade do |t|
    t.integer  "hunt_id"
    t.string   "description"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "clues", ["hunt_id"], name: "index_clues_on_hunt_id", using: :btree

  create_table "hunts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hunts", ["user_id"], name: "index_hunts_on_user_id", using: :btree

  create_table "scavenger_hunts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hunt_id"
    t.boolean  "completed",           default: false
    t.integer  "current_clue_number", default: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "scavenger_hunts", ["hunt_id"], name: "index_scavenger_hunts_on_hunt_id", using: :btree
  add_index "scavenger_hunts", ["user_id"], name: "index_scavenger_hunts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "clues", "hunts"
  add_foreign_key "hunts", "users"
  add_foreign_key "scavenger_hunts", "hunts"
  add_foreign_key "scavenger_hunts", "users"
end

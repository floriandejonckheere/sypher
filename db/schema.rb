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

ActiveRecord::Schema.define(version: 2018_09_26_113623) do

  create_table "blocked", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "blocked_user_id", null: false
    t.index ["blocked_user_id"], name: "index_blocked_on_blocked_user_id"
    t.index ["user_id"], name: "index_blocked_on_user_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "type", null: false
    t.string "topic"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.string "nickname"
    t.integer "user_id"
    t.integer "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_memberships_on_channel_id"
    t.index ["user_id", "channel_id"], name: "index_memberships_on_user_id_and_channel_id", unique: true
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text"
    t.string "uuid"
    t.integer "user_id"
    t.integer "channel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_messages_on_channel_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "phone", default: "", null: false
    t.string "name"
    t.datetime "last_seen_at"
    t.integer "pin"
    t.datetime "pin_sent_at"
    t.datetime "verified_at"
    t.integer "token_version", default: 1, null: false
    t.string "read_scope"
    t.string "seen_scope"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

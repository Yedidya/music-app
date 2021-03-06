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

ActiveRecord::Schema.define(version: 20150122014046) do

  create_table "chunks", force: true do |t|
    t.integer  "position"
    t.integer  "length"
    t.string   "track_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chunks_voices", force: true do |t|
    t.integer "chunk_id", null: false
    t.integer "voice_id", null: false
    t.text    "notes"
  end

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "version_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "song_url"
  end

  create_table "songs_tags", id: false, force: true do |t|
    t.integer "tag_id",  null: false
    t.integer "song_id", null: false
  end

  create_table "songs_tracks", id: false, force: true do |t|
    t.integer "track_id", null: false
    t.integer "song_id",  null: false
  end

  create_table "songs_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "song_id", null: false
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_members", force: true do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "song_id"
  end

  create_table "tracks_voices", id: false, force: true do |t|
    t.integer "track_id", null: false
    t.integer "voice_id", null: false
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "photo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: true do |t|
    t.integer  "user_id"
    t.integer  "version_number"
    t.integer  "song_id"
    t.string   "song_url"
    t.boolean  "master"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "message"
    t.string   "unmastered_file"
  end

  create_table "voices", force: true do |t|
    t.integer  "sampling_rate"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

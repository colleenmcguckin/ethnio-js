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

ActiveRecord::Schema.define(version: 20150729233752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chord_by_keys", force: :cascade do |t|
    t.integer  "key_id"
    t.integer  "chord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chords", force: :cascade do |t|
    t.string   "root"
    t.string   "quality"
    t.string   "audio_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "element_libraries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elements", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "element_library_id"
    t.integer  "length"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keys", force: :cascade do |t|
    t.string   "tonic"
    t.string   "quality"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lyrics", force: :cascade do |t|
    t.integer  "element_id"
    t.integer  "line_number"
    t.text     "lyric"
    t.integer  "song_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "songs", force: :cascade do |t|
    t.text     "name"
    t.string   "time_signature_id"
    t.string   "integer"
    t.integer  "key_id"
    t.integer  "tempo_id"
    t.boolean  "access"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "structures", force: :cascade do |t|
    t.integer  "chord_id"
    t.integer  "position"
    t.integer  "song_id"
    t.integer  "element_library_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
  end

  create_table "tempos", force: :cascade do |t|
    t.integer  "bpm"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tempo_name"
    t.string   "description"
  end

  create_table "time_signatures", force: :cascade do |t|
    t.integer  "beat_unit"
    t.integer  "bar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users", force: :cascade do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

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

ActiveRecord::Schema.define(version: 20180531044325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "decks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "deck_name"
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "gamers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "level"
    t.integer "exp"
  end

  create_table "monmons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "spd"
    t.integer "spdef"
    t.integer "spatk"
    t.integer "def"
    t.integer "atk"
    t.integer "hp"
    t.string "move1"
    t.string "move2"
    t.bigint "card_id"
    t.index ["card_id"], name: "index_monmons_on_card_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "spd"
    t.integer "spdef"
    t.integer "spatk"
    t.integer "def"
    t.integer "atk"
    t.integer "hp"
    t.string "move1"
    t.string "move2"
    t.string "name"
    t.bigint "deck_id"
    t.index ["deck_id"], name: "index_monsters_on_deck_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.bigint "gamers_id"
    t.string "password"
    t.index ["gamers_id"], name: "index_users_on_gamers_id"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "monsters", "decks"
end

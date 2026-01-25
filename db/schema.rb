# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_01_25_090070) do
  create_table "cars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "make", null: false
    t.string "model", null: false
    t.datetime "updated_at", null: false
    t.integer "year", null: false
  end

  create_table "croozers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "croozable_id", null: false
    t.string "croozable_type", null: false
    t.string "name", null: false
    t.string "reading_type", default: "odometer", null: false
    t.string "reading_unit", default: "km", null: false
    t.string "slug"
    t.integer "tender_id", null: false
    t.datetime "updated_at", null: false
    t.index ["croozable_type", "croozable_id"], name: "index_croozers_on_croozable"
    t.index ["slug"], name: "index_croozers_on_slug", unique: true
    t.index ["tender_id"], name: "index_croozers_on_tender_id"
  end

  create_table "passages", force: :cascade do |t|
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.integer "croozer_id", null: false
    t.decimal "end_reading", precision: 10, scale: 2
    t.integer "passageable_id", null: false
    t.string "passageable_type", null: false
    t.decimal "start_reading", precision: 10, scale: 2
    t.date "started_on", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_passages_on_author_id"
    t.index ["croozer_id", "started_on"], name: "index_passages_on_croozer_id_and_started_on"
    t.index ["croozer_id"], name: "index_passages_on_croozer_id"
    t.index ["passageable_type", "passageable_id"], name: "index_passages_on_passageable"
  end

  create_table "refuels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "fuel_type"
    t.boolean "full_tank", default: false, null: false
    t.decimal "liters", precision: 10, scale: 2, null: false
    t.integer "price_cents"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "tales", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "slug"
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_tales_on_slug", unique: true
  end

  create_table "tenders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "tenderable_id", null: false
    t.string "tenderable_type", null: false
    t.datetime "updated_at", null: false
    t.index ["tenderable_type", "tenderable_id"], name: "index_tenders_on_tenderable"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.string "password_digest", null: false
    t.string "slug"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["slug"], name: "index_users_on_slug", unique: true
  end

  add_foreign_key "croozers", "tenders"
  add_foreign_key "passages", "croozers"
  add_foreign_key "passages", "users", column: "author_id"
  add_foreign_key "sessions", "users"
end

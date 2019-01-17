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

ActiveRecord::Schema.define(version: 2019_01_17_231211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "account_type"
    t.bigint "user_id"
    t.bigint "shelter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelter_id"], name: "index_accounts_on_shelter_id"
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "adoption_requests", force: :cascade do |t|
    t.bigint "pet_id"
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "postcode"
    t.string "phone_number"
    t.bigint "shelter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state", default: "pending"
    t.index ["pet_id"], name: "index_adoption_requests_on_pet_id"
    t.index ["shelter_id"], name: "index_adoption_requests_on_shelter_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.text "medical_condition"
    t.string "image_link"
    t.string "race"
    t.bigint "shelter_id"
    t.string "state", default: "unavailable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelter_id"], name: "index_pets_on_shelter_id"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "org_type", default: "shelter"
    t.string "city"
    t.string "postcode"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "shelters"
  add_foreign_key "accounts", "users"
  add_foreign_key "adoption_requests", "pets"
  add_foreign_key "adoption_requests", "shelters"
  add_foreign_key "pets", "shelters"
end

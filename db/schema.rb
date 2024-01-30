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

ActiveRecord::Schema[7.1].define(version: 2024_01_30_114317) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "from_date"
    t.datetime "to_date"
    t.boolean "accepted", default: false
    t.bigint "user_id", null: false
    t.bigint "drone_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drone_id"], name: "index_bookings_on_drone_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "drones", force: :cascade do |t|
    t.float "price"
    t.string "brand"
    t.string "model"
    t.integer "time_in_air"
    t.text "description"
    t.integer "weight"
    t.string "category"
    t.boolean "availability", default: true
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_drones_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "drones"
  add_foreign_key "bookings", "users"
  add_foreign_key "drones", "users"
end

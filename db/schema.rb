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

ActiveRecord::Schema[7.0].define(version: 2023_11_04_135358) do
  create_table "customers", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.date "birthday"
    t.text "allergy"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "reservation_request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_request_id"], name: "index_notifications_on_reservation_request_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "reservation_requests", force: :cascade do |t|
    t.integer "hotel_id"
    t.integer "customer_id"
    t.integer "user_id"
    t.date "day"
    t.integer "number_of_people"
    t.boolean "is_smoking"
    t.string "food"
    t.string "course"
    t.text "memo"
    t.boolean "status"
    t.integer "reservation_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reservation_requests_on_customer_id"
    t.index ["hotel_id"], name: "index_reservation_requests_on_hotel_id"
    t.index ["user_id"], name: "index_reservation_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customers", "users"
  add_foreign_key "notifications", "reservation_requests"
  add_foreign_key "notifications", "users"
  add_foreign_key "reservation_requests", "customers"
  add_foreign_key "reservation_requests", "hotels"
  add_foreign_key "reservation_requests", "users"
end

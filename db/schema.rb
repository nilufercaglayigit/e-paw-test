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

ActiveRecord::Schema[7.1].define(version: 2023_12_20_170554) do
  create_table "appointments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "pet_id", null: false
    t.integer "vet_id", null: false
    t.datetime "date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_appointments_on_pet_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
    t.index ["vet_id"], name: "index_appointments_on_vet_id"
  end

  create_table "donations", force: :cascade do |t|
    t.datetime "donation_date"
    t.integer "donation_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "vet_id"
  end

  create_table "health_records", force: :cascade do |t|
    t.integer "pet_id", null: false
    t.integer "vet_id", null: false
    t.text "health_treatments"
    t.text "health_notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_health_records_on_pet_id"
    t.index ["vet_id"], name: "index_health_records_on_vet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "pet_name"
    t.date "pet_birthdate"
    t.string "animal_species"
    t.string "pet_kind"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "address", default: "", null: false
    t.date "birth_date", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vets", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.date "birth_date"
    t.string "certificate_no"
    t.index ["email"], name: "index_vets_on_email", unique: true
    t.index ["reset_password_token"], name: "index_vets_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "pets"
  add_foreign_key "appointments", "users"
  add_foreign_key "appointments", "vets"
  add_foreign_key "health_records", "pets"
  add_foreign_key "health_records", "vets"
  add_foreign_key "pets", "users"
end

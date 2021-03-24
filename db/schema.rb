# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_24_153131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.text "feedback"
    t.integer "status", default: 0
    t.date "day"
    t.text "reason"
    t.bigint "schedule_id", null: false
    t.bigint "patient_id", null: false
    t.bigint "psychologist_id", null: false
    t.bigint "diagnosis_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diagnosis_id"], name: "index_appointments_on_diagnosis_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["psychologist_id"], name: "index_appointments_on_psychologist_id"
    t.index ["schedule_id"], name: "index_appointments_on_schedule_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "description"
    t.bigint "patient_id", null: false
    t.bigint "appointment_id", null: false
    t.bigint "message_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_comments_on_appointment_id"
    t.index ["message_id"], name: "index_comments_on_message_id"
    t.index ["patient_id"], name: "index_comments_on_patient_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "day_name"
    t.integer "day_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "title"
    t.text "diagnosis"
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "patient_id", null: false
    t.index ["patient_id"], name: "index_diagnoses_on_patient_id"
  end

  create_table "hours", force: :cascade do |t|
    t.time "start_hour"
    t.time "end_hour"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.string "position"
    t.string "enterprise"
    t.bigint "psychologist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["psychologist_id"], name: "index_jobs_on_psychologist_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.integer "identity_document"
    t.string "nationality"
    t.date "birthdate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "psychologists", force: :cascade do |t|
    t.text "biography"
    t.string "linkedIn"
    t.integer "price"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_psychologists_on_user_id"
  end

  create_table "psychologists_specialties", id: false, force: :cascade do |t|
    t.bigint "psychologist_id", null: false
    t.bigint "specialty_id", null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.integer "quantity"
    t.text "description"
    t.bigint "appointment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_rankings_on_appointment_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "hour_id", null: false
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_schedules_on_day_id"
    t.index ["hour_id"], name: "index_schedules_on_hour_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name"
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transfers", force: :cascade do |t|
    t.date "day"
    t.integer "amount"
    t.string "code"
    t.bigint "appointment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["appointment_id"], name: "index_transfers_on_appointment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "token"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "person_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["person_id"], name: "index_users_on_person_id"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "diagnoses"
  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "psychologists"
  add_foreign_key "appointments", "schedules"
  add_foreign_key "comments", "appointments"
  add_foreign_key "comments", "comments", column: "message_id"
  add_foreign_key "comments", "patients"
  add_foreign_key "diagnoses", "patients"
  add_foreign_key "jobs", "psychologists"
  add_foreign_key "patients", "users"
  add_foreign_key "psychologists", "users"
  add_foreign_key "rankings", "appointments"
  add_foreign_key "schedules", "days"
  add_foreign_key "schedules", "hours"
  add_foreign_key "transfers", "appointments"
  add_foreign_key "users", "people"
end

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

ActiveRecord::Schema.define(version: 2022_07_12_103706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_statuses", force: :cascade do |t|
    t.string "p_status"
    t.text "working_hours"
    t.string "project_name"
    t.text "task"
    t.bigint "user_id", null: false
    t.bigint "manager_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager_id"], name: "index_daily_statuses_on_manager_id"
    t.index ["user_id"], name: "index_daily_statuses_on_user_id"
  end

  create_table "leaves", force: :cascade do |t|
    t.date "leave_from"
    t.date "leave_to"
    t.string "leave_mail_to"
    t.text "leave_reason"
    t.integer "manager_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.index ["user_id"], name: "index_leaves_on_user_id"
  end

  create_table "managers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.boolean "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "manager_id"
    t.index ["user_id", "created_at"], name: "index_projects_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "project_name"
    t.text "task"
    t.bigint "user_id", null: false
    t.integer "manager_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total_hours", default: 0
    t.index ["user_id", "created_at"], name: "index_statuses_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.integer "age"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "unconfirmed_email"
    t.boolean "admin"
    t.integer "manager_id"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["manager_id"], name: "index_users_on_manager_id", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "daily_statuses", "managers"
  add_foreign_key "daily_statuses", "users"
  add_foreign_key "leaves", "users"
  add_foreign_key "managers", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "statuses", "users"
end

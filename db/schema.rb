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

ActiveRecord::Schema.define(version: 2020_11_06_034044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "admins", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "updated_at"
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true
  end

  create_table "awards", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.float "amount", null: false
    t.string "purpose", null: false
    t.integer "tax_year", null: false
    t.uuid "granter_id", null: false
    t.uuid "filing_id", null: false
    t.uuid "recipient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["filing_id"], name: "index_awards_on_filing_id"
    t.index ["granter_id"], name: "index_awards_on_granter_id"
    t.index ["recipient_id"], name: "index_awards_on_recipient_id"
  end

  create_table "filings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "status", null: false
    t.uuid "granter_id"
    t.integer "awards_processed"
    t.integer "tax_year"
    t.json "award_errors"
    t.text "original_file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["granter_id"], name: "index_filings_on_granter_id"
  end

  create_table "granters", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "ein", null: false
    t.string "name", null: false
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "process_events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "status", null: false
    t.uuid "granter_id"
    t.integer "awards_processed"
    t.integer "tax_year"
    t.json "award_errors"
    t.text "original_file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["granter_id"], name: "index_process_events_on_granter_id"
  end

  create_table "recipients", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "ein"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "section"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "versions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "item_type", null: false
    t.uuid "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.jsonb "object"
    t.jsonb "object_changes"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end

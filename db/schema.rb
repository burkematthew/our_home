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

ActiveRecord::Schema[7.0].define(version: 2022_02_10_133861) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assignees", force: :cascade do |t|
    t.string "assignable_type"
    t.bigint "assignable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "member_id"
    t.index ["assignable_type", "assignable_id"], name: "index_assignees_on_assignable"
    t.index ["member_id"], name: "index_assignees_on_member_id"
  end

  create_table "budget_categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budgets", force: :cascade do |t|
    t.integer "month"
    t.string "description"
    t.integer "cash_flow_type"
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "budget_category_id"
    t.index ["budget_category_id"], name: "index_budgets_on_budget_category_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.text "description"
    t.datetime "starts_at", precision: nil
    t.datetime "ends_at", precision: nil
    t.bigint "event_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "assignable_type"
    t.bigint "assignable_id"
    t.index ["assignable_type", "assignable_id"], name: "index_events_on_assignable"
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
    t.index ["starts_at"], name: "index_events_on_starts_at"
  end

  create_table "lists", force: :cascade do |t|
    t.string "description"
    t.string "assignable_type"
    t.bigint "assignable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignable_type", "assignable_id"], name: "index_lists_on_assignable"
  end

  create_table "members", force: :cascade do |t|
    t.text "first_name"
    t.text "middle_name"
    t.text "last_name"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description"
    t.date "due_date"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "assignable_type"
    t.bigint "assignable_id"
    t.bigint "list_id"
    t.string "status"
    t.index ["assignable_type", "assignable_id"], name: "index_tasks_on_assignable"
    t.index ["due_date"], name: "index_tasks_on_due_date"
    t.index ["list_id"], name: "index_tasks_on_list_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "events", "event_types"
end

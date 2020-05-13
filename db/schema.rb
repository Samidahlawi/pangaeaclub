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

ActiveRecord::Schema.define(version: 2020_05_13_211420) do

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

  create_table "bookings", force: :cascade do |t|
    t.float "total", null: false
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_bookings_on_trip_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "guides", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "country", null: false
    t.string "hobby", null: false
    t.string "instagram"
    t.text "description", null: false
    t.string "profile_image", null: false
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_includeds", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_includeds_trips", force: :cascade do |t|
    t.bigint "item_included_id", null: false
    t.bigint "trip_id", null: false
    t.index ["item_included_id"], name: "index_item_includeds_trips_on_item_included_id"
    t.index ["trip_id"], name: "index_item_includeds_trips_on_trip_id"
  end

  create_table "item_not_includeds", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_not_includeds_trips", force: :cascade do |t|
    t.bigint "item_not_included_id", null: false
    t.bigint "trip_id", null: false
    t.index ["item_not_included_id"], name: "index_item_not_includeds_trips_on_item_not_included_id"
    t.index ["trip_id"], name: "index_item_not_includeds_trips_on_trip_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "title", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.string "image"
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_itineraries_on_trip_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "gender", null: false
    t.bigint "booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["booking_id"], name: "index_participants_on_booking_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "title", null: false
    t.string "sub_title", null: false
    t.string "trip_type", null: false
    t.string "country", null: false
    t.string "destination", null: false
    t.date "deadline", null: false
    t.string "level", null: false
    t.string "bg_image", null: false
    t.integer "group_size_start"
    t.integer "group_size_end", null: false
    t.integer "duration", null: false
    t.string "image"
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.text "description", null: false
    t.float "price", null: false
    t.bigint "guide_id", null: false
    t.bigint "region_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guide_id"], name: "index_trips_on_guide_id"
    t.index ["region_id"], name: "index_trips_on_region_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.string "country", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "trips"
  add_foreign_key "bookings", "users"
  add_foreign_key "item_includeds_trips", "item_includeds"
  add_foreign_key "item_includeds_trips", "trips"
  add_foreign_key "item_not_includeds_trips", "item_not_includeds"
  add_foreign_key "item_not_includeds_trips", "trips"
  add_foreign_key "itineraries", "trips"
  add_foreign_key "participants", "bookings"
  add_foreign_key "trips", "guides"
  add_foreign_key "trips", "regions"
end

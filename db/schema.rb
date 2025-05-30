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

ActiveRecord::Schema.define(version: 2025_05_07_050531) do

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
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.text "self_introduction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "subject", null: false
    t.text "message", null: false
    t.boolean "is_read", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.text "self_introduction"
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "sneaker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_favorites_on_customer_id"
    t.index ["sneaker_id"], name: "index_favorites_on_sneaker_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "sneaker_id"
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_posts_on_customer_id"
    t.index ["sneaker_id"], name: "index_posts_on_sneaker_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "size_value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sneaker_brands", force: :cascade do |t|
    t.string "name", null: false
    t.text "overview", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_sneaker_brands_on_name"
  end

  create_table "sneaker_comment_favorites", force: :cascade do |t|
    t.integer "sneaker_comment_id"
    t.integer "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_sneaker_comment_favorites_on_customer_id"
    t.index ["sneaker_comment_id"], name: "index_sneaker_comment_favorites_on_sneaker_comment_id"
  end

  create_table "sneaker_comments", force: :cascade do |t|
    t.text "comment", null: false
    t.integer "customer_id"
    t.integer "sneaker_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_sneaker_comments_on_customer_id"
    t.index ["sneaker_id"], name: "index_sneaker_comments_on_sneaker_id"
  end

  create_table "sneaker_sizes", force: :cascade do |t|
    t.integer "sneaker_id"
    t.integer "size_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["size_id"], name: "index_sneaker_sizes_on_size_id"
    t.index ["sneaker_id"], name: "index_sneaker_sizes_on_sneaker_id"
  end

  create_table "sneaker_types", force: :cascade do |t|
    t.integer "sneaker_brand_id"
    t.text "overview", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sneaker_brand_id"], name: "index_sneaker_types_on_sneaker_brand_id"
  end

  create_table "sneakers", force: :cascade do |t|
    t.integer "admin_id"
    t.integer "customer_id"
    t.integer "sneaker_type_id"
    t.string "sneaker_name_en", null: false
    t.string "sneaker_name_jp", null: false
    t.date "year_of_manufacture", null: false
    t.boolean "month_is_unknown", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_sneakers_on_admin_id"
    t.index ["customer_id"], name: "index_sneakers_on_customer_id"
    t.index ["sneaker_type_id"], name: "index_sneakers_on_sneaker_type_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favorites", "customers"
  add_foreign_key "favorites", "sneakers"
  add_foreign_key "posts", "customers"
  add_foreign_key "posts", "sneakers"
  add_foreign_key "sneaker_comment_favorites", "customers"
  add_foreign_key "sneaker_comment_favorites", "sneaker_comments"
  add_foreign_key "sneaker_comments", "customers"
  add_foreign_key "sneaker_comments", "sneakers"
  add_foreign_key "sneaker_sizes", "sizes"
  add_foreign_key "sneaker_sizes", "sneakers"
  add_foreign_key "sneaker_types", "sneaker_brands"
  add_foreign_key "sneakers", "admins"
  add_foreign_key "sneakers", "customers"
  add_foreign_key "sneakers", "sneaker_types"
end

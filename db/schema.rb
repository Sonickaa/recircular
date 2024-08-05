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

ActiveRecord::Schema[7.1].define(version: 2024_08_05_103832) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", force: :cascade do |t|
    t.bigint "user_sender_id", null: false
    t.bigint "user_receiver_id", null: false
    t.string "name"
    t.datetime "last_message", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_receiver_id"], name: "index_chats_on_user_receiver_id"
    t.index ["user_sender_id"], name: "index_chats_on_user_sender_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chat_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "offer_lists", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_offer_lists_on_offer_id"
    t.index ["product_id"], name: "index_offer_lists_on_product_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_sender_id", null: false
    t.bigint "user_receiver_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_receiver_id"], name: "index_offers_on_user_receiver_id"
    t.index ["user_sender_id"], name: "index_offers_on_user_sender_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.string "product_picture"
    t.string "product_title"
    t.string "product_condition"
    t.string "product_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "user_categories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_user_categories_on_category_id"
    t.index ["user_id"], name: "index_user_categories_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "user_name"
    t.string "bio"
    t.string "profile_picture"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_wants_on_product_id"
    t.index ["user_id"], name: "index_wants_on_user_id"
  end

  add_foreign_key "chats", "users", column: "user_receiver_id"
  add_foreign_key "chats", "users", column: "user_sender_id"
  add_foreign_key "favorites", "products"
  add_foreign_key "favorites", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "offer_lists", "offers"
  add_foreign_key "offer_lists", "products"
  add_foreign_key "offers", "users", column: "user_receiver_id"
  add_foreign_key "offers", "users", column: "user_sender_id"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "users"
  add_foreign_key "user_categories", "categories"
  add_foreign_key "user_categories", "users"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "wants", "products"
  add_foreign_key "wants", "users"
end

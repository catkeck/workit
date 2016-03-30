# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160330013049) do

  create_table "foods", force: :cascade do |t|
    t.string   "brand_name"
    t.integer  "item_id"
    t.string   "item_name"
    t.integer  "user_id"
    t.string   "date"
    t.float    "servings"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "description"
    t.text     "ingredients"
    t.integer  "calories"
    t.integer  "calories_from_fat"
    t.integer  "total_fat"
    t.integer  "saturated_fat"
    t.integer  "cholesterol"
    t.integer  "sodium"
    t.integer  "carbohydrates"
    t.integer  "dietary_fiber"
    t.integer  "sugars"
    t.integer  "protein"
    t.integer  "vitamin_a"
    t.integer  "vitamin_c"
    t.integer  "calcium"
    t.integer  "iron"
    t.integer  "potassium"
    t.integer  "serving_size"
    t.string   "serving_unit"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "friend_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.integer  "friend_id"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "weights", force: :cascade do |t|
    t.float    "weight"
    t.string   "date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

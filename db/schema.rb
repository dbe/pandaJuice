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

ActiveRecord::Schema.define(version: 20160217194310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.datetime "last_modified"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "carts_line_items", id: false, force: :cascade do |t|
    t.integer "cart_id",      null: false
    t.integer "line_item_id", null: false
  end

  create_table "item_options", force: :cascade do |t|
    t.integer  "item_id",    null: false
    t.string   "name",       null: false
    t.string   "value",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "value", "item_id"], name: "index_item_options_on_name_and_value_and_item_id", unique: true, using: :btree
  end

  create_table "item_options_variants", id: false, force: :cascade do |t|
    t.integer "item_option_id", null: false
    t.integer "variant_id",     null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "sale_variant_id",                           null: false
    t.integer "quantity",                                  null: false
    t.decimal "actual_unit_price", precision: 8, scale: 2, null: false
  end

  create_table "sale_variants", force: :cascade do |t|
    t.integer "sale_id"
    t.integer "variant_id"
    t.integer "total_quantity"
    t.integer "quantity_left"
    t.decimal "cost",           precision: 8, scale: 2
    t.index ["sale_id"], name: "index_sale_variants_on_sale_id", using: :btree
    t.index ["variant_id"], name: "index_sale_variants_on_variant_id", using: :btree
  end

  create_table "sales", force: :cascade do |t|
    t.datetime "start",                      null: false
    t.datetime "finish",                     null: false
    t.boolean  "current",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "variants", force: :cascade do |t|
    t.string   "sku",        null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sku"], name: "index_variants_on_sku", unique: true, using: :btree
  end

end

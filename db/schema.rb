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

ActiveRecord::Schema.define(version: 20161115032905) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "stripe_publishable_key"
    t.string   "stripe_secret_key"
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cart_products", ["cart_id"], name: "index_cart_products_on_cart_id"
  add_index "cart_products", ["product_id"], name: "index_cart_products_on_product_id"

  create_table "carts", force: :cascade do |t|
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "carts", ["customer_id"], name: "index_carts_on_customer_id"

  create_table "categories", force: :cascade do |t|
    t.string  "name"
    t.text    "description"
    t.string  "image"
    t.integer "parent_id"
    t.integer "depth",       default: 0, null: false
    t.string  "slug"
  end

  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id"
  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true

  create_table "category_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_products", ["category_id"], name: "index_category_products_on_category_id"
  add_index "category_products", ["product_id"], name: "index_category_products_on_product_id"

  create_table "customers", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "order_products", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.integer  "seller_id"
    t.integer  "quantity"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_products", ["order_id"], name: "index_order_products_on_order_id"
  add_index "order_products", ["product_id"], name: "index_order_products_on_product_id"
  add_index "order_products", ["seller_id"], name: "index_order_products_on_seller_id"

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "images"
    t.decimal  "price",          precision: 8, scale: 2
    t.integer  "quantity"
    t.text     "files"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.integer  "seller_id"
    t.string   "slug"
    t.integer  "price_cents",                            default: 0,     null: false
    t.string   "price_currency",                         default: "USD", null: false
  end

  add_index "products", ["price"], name: "index_products_on_price"
  add_index "products", ["seller_id"], name: "index_products_on_seller_id"
  add_index "products", ["slug"], name: "index_products_on_slug", unique: true
  add_index "products", ["title"], name: "index_products_on_title"

  create_table "sellers", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.string   "phone_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "seller_name"
    t.integer  "status",          limit: 1
    t.string   "on_vacation"
    t.string   "tax_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end

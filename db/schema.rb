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

ActiveRecord::Schema.define(version: 20160723135740) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "e_stuk_sales", force: :cascade do |t|
    t.string   "buyer_email"
    t.string   "seller_email"
    t.integer  "amount"
    t.string   "guid"
    t.integer  "stuk_book_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "state"
    t.string   "stripe_id"
    t.string   "stripe_token"
    t.text     "error"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "stuk_books", force: :cascade do |t|
    t.string   "name"
    t.string   "author"
    t.text     "description"
    t.integer  "price"
    t.boolean  "availability"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.string   "image"
    t.string   "resource"
    t.string   "slug"
  end

  add_index "stuk_books", ["slug"], name: "index_stuk_books_on_slug", unique: true, using: :btree

  create_table "stuk_starter_pledges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stuk_starter_reward_id"
    t.integer  "amount"
    t.decimal  "shipping"
    t.date     "expiration_date"
    t.string   "uuid"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "postal_code"
    t.string   "status"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "stuk_starter_pledges", ["stuk_starter_reward_id"], name: "index_stuk_starter_pledges_on_stuk_starter_reward_id", using: :btree
  add_index "stuk_starter_pledges", ["user_id"], name: "index_stuk_starter_pledges_on_user_id", using: :btree

  create_table "stuk_starter_projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "short_description"
    t.text     "description"
    t.string   "image_url"
    t.string   "status",            default: "pending"
    t.string   "goal"
    t.string   "expiration_date"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "stuk_starter_projects", ["user_id"], name: "index_stuk_starter_projects_on_user_id", using: :btree

  create_table "stuk_starter_rewards", force: :cascade do |t|
    t.integer  "stuk_starter_project_id"
    t.text     "description"
    t.integer  "value"
    t.decimal  "shipping",                precision: 8, scale: 2
    t.integer  "number_available"
    t.date     "estimated_delivery"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "stuk_starter_rewards", ["stuk_starter_project_id"], name: "index_stuk_starter_rewards_on_stuk_starter_project_id", using: :btree

  create_table "stuk_todo_tasks", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
    t.string   "state",        default: "to_do"
    t.text     "content_html"
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "customer_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "stuk_starter_pledges", "stuk_starter_rewards"
  add_foreign_key "stuk_starter_pledges", "users"
  add_foreign_key "stuk_starter_projects", "users"
  add_foreign_key "stuk_starter_rewards", "stuk_starter_projects"
end

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

ActiveRecord::Schema.define(version: 20150721202405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "associates", force: :cascade do |t|
    t.string   "name"
    t.date     "admission_date"
    t.string   "phone"
    t.string   "address"
    t.string   "zip_code"
    t.string   "email"
    t.string   "account_number"
    t.string   "clabe"
    t.boolean  "is_supervisor"
    t.integer  "supervisor_id"
    t.integer  "city_id"
    t.integer  "bank_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "associates", ["bank_id"], name: "index_associates_on_bank_id", using: :btree
  add_index "associates", ["city_id"], name: "index_associates_on_city_id", using: :btree
  add_index "associates", ["supervisor_id"], name: "index_associates_on_supervisor_id", using: :btree

  create_table "banks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "state_id"
  end

  create_table "commission_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commissions", force: :cascade do |t|
    t.decimal  "purchase_amount"
    t.date     "calculation_start_date"
    t.date     "calculation_end_date"
    t.decimal  "amount"
    t.integer  "type_id"
    t.boolean  "payed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commissions", ["type_id"], name: "index_commissions_on_type_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "rfc"
    t.string   "address"
    t.string   "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.float    "price"
    t.text     "description"
    t.integer  "purchase_min_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supervisor_commissions", force: :cascade do |t|
    t.float    "total"
    t.date     "start_date_comission"
    t.date     "end_date_comission"
    t.float    "comission"
    t.boolean  "paid"
    t.integer  "supervisor_id"
    t.string   "supervisor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "supervisor_commissions", ["supervisor_id"], name: "index_supervisor_commissions_on_supervisor_id", using: :btree

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
    t.string   "auth_token",             default: ""
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end

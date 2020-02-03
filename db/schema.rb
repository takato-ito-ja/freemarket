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

ActiveRecord::Schema.define(version: 20200203104344) do

  create_table "areas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                 null: false
    t.integer  "category",                             null: false
    t.integer  "price",                                null: false
    t.text     "description",            limit: 65535, null: false
    t.integer  "condition",                            null: false
    t.integer  "postage_burden",                       null: false
    t.integer  "area",                                 null: false
    t.integer  "scheduled_sending_date",               null: false
    t.integer  "size",                                 null: false
    t.integer  "status",                               null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "payment_method",                       null: false
    t.integer  "payment_status",                       null: false
    t.integer  "sending_status",                       null: false
    t.integer  "recieving_status",                     null: false
    t.integer  "sending_methods",                      null: false
    t.integer  "category_id"
    t.integer  "brand_id"
    t.integer  "area_id"
    t.index ["area_id"], name: "index_products_on_area_id", using: :btree
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "nickname",               limit: 50,                 null: false
    t.string   "first_name",             limit: 50,                 null: false
    t.string   "last_name",              limit: 50,                 null: false
    t.string   "first_name_kana",        limit: 50,                 null: false
    t.string   "last_name_kana",         limit: 50,                 null: false
    t.integer  "phone_number",                                      null: false
    t.date     "birthday",                                          null: false
    t.text     "icon",                   limit: 65535
    t.text     "introduction",           limit: 65535
    t.integer  "seller_id",                                         null: false
    t.integer  "buyer_id",                                          null: false
    t.string   "reset_password_token",                              null: false
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at",                               null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "products", "areas"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
end

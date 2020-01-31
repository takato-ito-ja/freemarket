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

ActiveRecord::Schema.define(version: 20200131035419) do

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
    t.string   "reset_password_token",                              null: false
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at",                               null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end

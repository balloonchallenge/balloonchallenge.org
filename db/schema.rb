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

ActiveRecord::Schema.define(version: 20140930044429) do

  create_table "group_memberships", force: true do |t|
    t.string  "member_type"
    t.integer "member_id"
    t.integer "group_id"
    t.string  "group_name"
    t.string  "membership_type"
  end

  add_index "group_memberships", ["group_id"], name: "index_group_memberships_on_group_id"
  add_index "group_memberships", ["group_name"], name: "index_group_memberships_on_group_name"
  add_index "group_memberships", ["member_id", "member_type"], name: "index_group_memberships_on_member_id_and_member_type"

  create_table "groups", force: true do |t|
    t.string "type"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               default: "", null: false
    t.string   "name",                   default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

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

ActiveRecord::Schema.define(version: 20170723224352) do

  create_table "attached_assets", force: :cascade do |t|
    t.string   "asset_file_name",    limit: 255
    t.string   "asset_content_type", limit: 255
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "team_id"
    t.string   "category",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attached_assets", ["category"], name: "index_attached_assets_on_category"

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: :cascade do |t|
    t.text     "name",                  limit: 255, default: "", null: false
    t.text     "school",                limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "latitude",              limit: 255
    t.string   "longitude",             limit: 255
    t.string   "city",                  limit: 255, default: "", null: false
    t.string   "state_code",            limit: 255
    t.string   "country_code",          limit: 255, default: "", null: false
    t.text     "why_join",              limit: 255
    t.text     "plan",                  limit: 255
    t.text     "find_out",              limit: 255
    t.boolean  "host_payload"
    t.boolean  "have_payload"
    t.boolean  "buddies_mentor"
    t.boolean  "buddies_mentee"
    t.boolean  "ages_0_10"
    t.boolean  "ages_11_17"
    t.boolean  "ages_18_26"
    t.boolean  "ages_27_50"
    t.boolean  "ages_50_up"
    t.text     "url"
    t.string   "team_img_file_name",    limit: 255
    t.string   "team_img_content_type", limit: 255
    t.integer  "team_img_file_size"
    t.datetime "team_img_updated_at"
    t.string   "launch_date",           limit: 255
    t.boolean  "signed_up_2015"
    t.boolean  "signed_up_2016"
    t.boolean  "flew_2015"
    t.boolean  "flew_2014"
    t.boolean  "signed_up_2017"
    t.boolean  "flew_2016"
    t.boolean  "signed_up_2018"
    t.boolean  "flew_2017"
    t.boolean  "signed_up_2019"
    t.boolean  "flew_2018"
    t.boolean  "signed_up_2020"
    t.boolean  "flew_2019"
  end

  add_index "teams", ["launch_date"], name: "index_teams_on_launch_date"
  add_index "teams", ["name"], name: "index_teams_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255, default: ""
    t.integer  "team_id"
    t.boolean  "admin"
    t.boolean  "pastlaunch"
    t.boolean  "gsbc_last_year"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.boolean  "email_ignore"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["team_id"], name: "index_users_on_team_id"

end

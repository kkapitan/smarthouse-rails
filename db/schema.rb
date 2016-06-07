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

ActiveRecord::Schema.define(version: 20160606114516) do

  create_table "action_subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "state",         default: 0, null: false
    t.string   "configuration"
  end

  create_table "action_triggers", force: :cascade do |t|
    t.integer  "weeks"
    t.integer  "hours"
    t.integer  "minutes"
    t.integer  "day_hour"
    t.integer  "start_hour"
    t.integer  "finish_hour"
    t.text     "week_days"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "trigger_type", default: 0, null: false
    t.integer  "beacon_id"
  end

  add_index "action_triggers", ["beacon_id"], name: "index_action_triggers_on_beacon_id"

  create_table "actions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "action_subject_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "action_type",       default: 0, null: false
    t.integer  "action_trigger_id"
  end

  add_index "actions", ["action_subject_id"], name: "index_actions_on_action_subject_id"
  add_index "actions", ["action_trigger_id"], name: "index_actions_on_action_trigger_id"
  add_index "actions", ["user_id"], name: "index_actions_on_user_id"

  create_table "beacons", force: :cascade do |t|
    t.string   "name"
    t.integer  "major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "auth_token"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

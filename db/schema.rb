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

ActiveRecord::Schema.define(version: 20150828105705) do

  create_table "battles", force: :cascade do |t|
    t.datetime "start"
    t.integer  "first_fighter_id",  limit: 4
    t.integer  "second_fighter_id", limit: 4
    t.integer  "winner_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "battles", ["first_fighter_id"], name: "index_battles_on_first_fighter_id", using: :btree
  add_index "battles", ["second_fighter_id"], name: "index_battles_on_second_fighter_id", using: :btree
  add_index "battles", ["winner_id"], name: "index_battles_on_winner_id", using: :btree

  create_table "pet_types", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pet_types", ["code"], name: "index_pet_types_on_code", using: :btree

  create_table "pets", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.date     "birthdate"
    t.integer  "user_id",               limit: 4
    t.integer  "pet_type_id",           limit: 4
    t.integer  "sex_id",                limit: 4
    t.integer  "first_fighters_count",  limit: 4,   default: 0
    t.integer  "second_fighters_count", limit: 4,   default: 0
    t.integer  "winners_count",         limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pets", ["pet_type_id"], name: "index_pets_on_pet_type_id", using: :btree
  add_index "pets", ["sex_id"], name: "index_pets_on_sex_id", using: :btree
  add_index "pets", ["user_id"], name: "index_pets_on_user_id", using: :btree

  create_table "sex", force: :cascade do |t|
    t.string   "code",       limit: 255
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sex", ["code"], name: "index_sex_on_code", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end

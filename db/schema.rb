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

ActiveRecord::Schema.define(version: 20140715024444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fun_facts", force: true do |t|
    t.string   "type",        null: false
    t.decimal  "position"
    t.string   "name",        null: false
    t.string   "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fun_facts_open_datasets", id: false, force: true do |t|
    t.integer "open_dataset_id"
    t.integer "fun_fact_id"
  end

  add_index "fun_facts_open_datasets", ["fun_fact_id"], name: "index_fun_facts_open_datasets_on_fun_fact_id", using: :btree
  add_index "fun_facts_open_datasets", ["open_dataset_id"], name: "index_fun_facts_open_datasets_on_open_dataset_id", using: :btree

  create_table "open_datasets", force: true do |t|
    t.string   "type",       null: false
    t.string   "name"
    t.string   "uid",        null: false
    t.string   "url",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "open_datasets", ["uid"], name: "index_open_datasets_on_uid", using: :btree

end

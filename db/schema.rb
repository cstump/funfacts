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

ActiveRecord::Schema.define(version: 20140915020142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "datasets", force: true do |t|
    t.string   "name",       null: false
    t.string   "uid",        null: false
    t.string   "uri",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "datasets", ["name"], name: "index_datasets_on_name", using: :btree

  create_table "datasets_facts", id: false, force: true do |t|
    t.integer "dataset_id", null: false
    t.integer "fact_id",    null: false
  end

  add_index "datasets_facts", ["dataset_id"], name: "index_datasets_facts_on_dataset_id", using: :btree
  add_index "datasets_facts", ["fact_id"], name: "index_datasets_facts_on_fact_id", using: :btree

  create_table "facts", force: true do |t|
    t.decimal  "position"
    t.string   "name",       null: false
    t.string   "heading"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facts_regions", id: false, force: true do |t|
    t.integer "fact_id",   null: false
    t.integer "region_id", null: false
  end

  add_index "facts_regions", ["fact_id"], name: "index_facts_regions_on_fact_id", using: :btree
  add_index "facts_regions", ["region_id"], name: "index_facts_regions_on_region_id", using: :btree

  create_table "regions", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

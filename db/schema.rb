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

ActiveRecord::Schema.define(version: 20150323010630) do

  create_table "columns", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "columns_datasets", id: false, force: :cascade do |t|
    t.integer "dataset_id", limit: 4, null: false
    t.integer "column_id",  limit: 4, null: false
  end

  add_index "columns_datasets", ["column_id"], name: "index_columns_datasets_on_column_id", using: :btree
  add_index "columns_datasets", ["dataset_id"], name: "index_columns_datasets_on_dataset_id", using: :btree

  create_table "datasets", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "uid",        limit: 255, null: false
    t.string   "uri",        limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "datasets", ["name"], name: "index_datasets_on_name", using: :btree

  create_table "datasets_facts", id: false, force: :cascade do |t|
    t.integer "dataset_id", limit: 4, null: false
    t.integer "fact_id",    limit: 4, null: false
  end

  add_index "datasets_facts", ["dataset_id"], name: "index_datasets_facts_on_dataset_id", using: :btree
  add_index "datasets_facts", ["fact_id"], name: "index_datasets_facts_on_fact_id", using: :btree

  create_table "facts", force: :cascade do |t|
    t.decimal  "position",               precision: 10
    t.string   "name",       limit: 255,                null: false
    t.string   "heading",    limit: 255
    t.string   "body",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facts_regions", id: false, force: :cascade do |t|
    t.integer "fact_id",   limit: 4, null: false
    t.integer "region_id", limit: 4, null: false
  end

  add_index "facts_regions", ["fact_id"], name: "index_facts_regions_on_fact_id", using: :btree
  add_index "facts_regions", ["region_id"], name: "index_facts_regions_on_region_id", using: :btree

  create_table "regions", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

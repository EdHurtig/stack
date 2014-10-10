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

ActiveRecord::Schema.define(version: 20141010143353) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "content"
    t.string   "level"
    t.integer  "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "by"
  end

  create_table "facts", force: true do |t|
    t.string   "name"
    t.string   "data"
    t.integer  "event"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", force: true do |t|
    t.string   "name"
    t.string   "handler"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "port"
    t.string   "kind"
    t.string   "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  create_table "tag_relationships", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tag"
    t.integer  "event"
  end

  create_table "tags", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end

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

ActiveRecord::Schema.define(version: 20141010175839) do

  create_table "lawyers", force: true do |t|
    t.string   "code",                null: false
    t.string   "name",                null: false
    t.integer  "years_of_experience"
    t.string   "location",            null: false
    t.float    "average_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lawyers", ["code"], name: "index_lawyers_on_code", unique: true
  add_index "lawyers", ["location"], name: "index_lawyers_on_location"

  create_table "service_charges", force: true do |t|
    t.float    "charge",     null: false
    t.integer  "lawyer_id",  null: false
    t.integer  "service_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_charges", ["lawyer_id"], name: "index_service_charges_on_lawyer_id"
  add_index "service_charges", ["service_id"], name: "index_service_charges_on_service_id"

  create_table "services", force: true do |t|
    t.string   "code",       null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["code"], name: "index_services_on_code", unique: true
  add_index "services", ["name"], name: "index_services_on_name"

end

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

ActiveRecord::Schema.define(version: 20171007195129) do

  create_table "booked_flights", force: true do |t|
    t.integer  "flight_id"
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "booked_flights", ["flight_id"], name: "index_booked_flights_on_flight_id"

  create_table "flights", force: true do |t|
    t.string   "location_from"
    t.string   "location_to"
    t.string   "boarding_time"
    t.string   "departure_time"
    t.integer  "gate_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.string   "duration"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

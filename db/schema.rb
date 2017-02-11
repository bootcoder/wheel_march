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

ActiveRecord::Schema.define(version: 20170211204813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "driver_details", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.string   "tag"
    t.integer  "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_driver_details_on_driver_id", using: :btree
  end

  create_table "invitations", force: :cascade do |t|
    t.string   "status"
    t.string   "code"
    t.integer  "driver_id"
    t.integer  "new_driver_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["driver_id"], name: "index_invitations_on_driver_id", using: :btree
    t.index ["new_driver_id"], name: "index_invitations_on_new_driver_id", using: :btree
  end

  create_table "passenger_rides", force: :cascade do |t|
    t.string   "pickup_address"
    t.integer  "passenger_id"
    t.integer  "ride_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["passenger_id"], name: "index_passenger_rides_on_passenger_id", using: :btree
    t.index ["ride_id"], name: "index_passenger_rides_on_ride_id", using: :btree
  end

  create_table "rides", force: :cascade do |t|
    t.integer  "max_seats"
    t.integer  "max_range"
    t.string   "start_point"
    t.string   "end_point"
    t.datetime "start_time"
    t.integer  "driver_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["driver_id"], name: "index_rides_on_driver_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "zip"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

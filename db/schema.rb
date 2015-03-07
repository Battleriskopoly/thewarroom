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

ActiveRecord::Schema.define(version: 20150307175708) do

# Could not dump table "battles" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "conversations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_attributes", force: true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status"
    t.integer  "place"
    t.string   "food_units"
    t.string   "energy_units"
    t.string   "money"
    t.string   "population"
    t.string   "militants"
  end

  create_table "games", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "private"
    t.string   "central_america_owner_id"
    t.string   "central_asia_owner_id"
    t.string   "central_south_america_owner_id"
    t.string   "china_owner_id"
    t.string   "coastal_africa_owner_id"
    t.string   "coastal_south_america_owner_id"
    t.string   "congo_owner_id"
    t.string   "east_africa_owner_id"
    t.string   "eastern_canada_owner_id"
    t.string   "eastern_south_america_owner_id"
    t.string   "egypt_owner_id"
    t.string   "greenland_owner_id"
    t.string   "iceland_owner_id"
    t.string   "india_owner_id"
    t.string   "indonesia_owner_id"
    t.string   "madagascar_owner_id"
    t.string   "middle_east_owner_id"
    t.string   "mongolia_owner_id"
    t.string   "non_contiguous_united_states_owner_id"
    t.string   "northeastern_united_states_owner_id"
    t.string   "northern_australia_owner_id"
    t.string   "northern_europe_owner_id"
    t.string   "northwestern_united_states_owner_id"
    t.string   "pacific_asia_owner_id"
    t.string   "russia_owner_id"
    t.string   "sahara_owner_id"
    t.string   "southeastern_asia_owner_id"
    t.string   "southeastern_united_states_owner_id"
    t.string   "southern_african_territory_owner_id"
    t.string   "southern_australia_owner_id"
    t.string   "southern_europe_owner_id"
    t.string   "southwestern_united_states_owner_id"
    t.string   "ukraine_owner_id"
    t.string   "united_kingdom_owner_id"
    t.string   "western_europe_owner_id"
    t.string   "western_canada_owner_id"
    t.string   "western_south_america_owner_id"
    t.integer  "user_id"
    t.boolean  "start_status"
    t.integer  "players"
    t.date     "start_date"
    t.string   "invitation"
    t.integer  "new_zealand_owner_id"
  end

  create_table "legs", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trade_id"
    t.string   "location_type"
    t.integer  "location_id"
    t.integer  "trade_index"
  end

  create_table "locations", force: true do |t|
    t.string   "type"
    t.integer  "game_id"
    t.integer  "user_id"
    t.string   "territory"
    t.integer  "food_units"
    t.integer  "energy_units"
    t.integer  "money"
    t.integer  "militants"
    t.integer  "population"
    t.integer  "xco"
    t.integer  "yco"
    t.datetime "active_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "pieces" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "trades", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sending_user_id"
    t.integer  "recipient_user_id"
    t.integer  "game_id"
    t.string   "what"
    t.integer  "quantity"
    t.integer  "sending_location_id"
    t.integer  "recipient_location_id"
    t.string   "sending_location_type"
    t.string   "recipient_location_type"
    t.float    "cost"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "game_id"
    t.string   "color"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end

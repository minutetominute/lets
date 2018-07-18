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

ActiveRecord::Schema.define(version: 20180718154831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.string "aasm_state"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "karma_points"
    t.text "description"
    t.string "aasm_state"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "offer_id"
    t.bigint "request_id"
    t.string "aasm_state"
    t.index ["offer_id"], name: "index_transactions_on_offer_id"
    t.index ["request_id"], name: "index_transactions_on_request_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end

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

ActiveRecord::Schema.define(version: 20180719161000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "confirmations", force: :cascade do |t|
    t.bigint "offerer_id"
    t.bigint "requester_id"
    t.bigint "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offerer_id"], name: "index_confirmations_on_offerer_id"
    t.index ["requester_id"], name: "index_confirmations_on_requester_id"
    t.index ["transaction_id"], name: "index_confirmations_on_transaction_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "service_request_id"
    t.integer "karma_points"
    t.text "description"
    t.string "aasm_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_request_id"], name: "index_offers_on_service_request_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "service_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.string "aasm_state"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_service_requests_on_user_id"
  end

  create_table "service_transactions", force: :cascade do |t|
    t.bigint "offer_id"
    t.string "aasm_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_service_transactions_on_offer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "confirmations", "users", column: "offerer_id"
  add_foreign_key "confirmations", "users", column: "requester_id"
end

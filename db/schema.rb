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

ActiveRecord::Schema.define(version: 20170815184133) do

  create_table "digital_assets", force: :cascade do |t|
    t.string "name"
    t.string "ticker"
    t.string "proof_type"
    t.float "usd_price"
    t.float "btc_price"
    t.float "eth_price"
    t.float "usd_marketcap"
    t.integer "total_coin_supply", limit: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

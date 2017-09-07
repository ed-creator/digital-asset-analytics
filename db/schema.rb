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

ActiveRecord::Schema.define(version: 20170831144835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "digital_assets", force: :cascade do |t|
    t.string "name"
    t.string "ticker"
    t.string "proof_type"
    t.float "usd_price"
    t.float "btc_price"
    t.float "eth_price"
    t.float "usd_marketcap"
    t.bigint "total_coin_supply"
    t.bigint "available_coin_supply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "github_profiles", force: :cascade do |t|
    t.string "org_name"
    t.string "html_url"
    t.integer "public_repos"
    t.bigint "digital_asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["digital_asset_id"], name: "index_github_profiles_on_digital_asset_id"
  end

  create_table "github_repos", force: :cascade do |t|
    t.string "name"
    t.integer "size"
    t.integer "stargazers_count"
    t.integer "watchers_count"
    t.integer "forks_count"
    t.integer "open_issues_count"
    t.integer "subscribers_count"
    t.integer "network_count"
    t.integer "github_id"
    t.bigint "github_profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["github_profile_id"], name: "index_github_repos_on_github_profile_id"
  end

  create_table "price_histories", force: :cascade do |t|
    t.bigint "digital_asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "date_integer_timestamp"
    t.float "close"
    t.float "volume_from_usd"
    t.float "volume_to_usd"
    t.float "volume_from_btc"
    t.float "volume_to_btc"
    t.float "volume_from_eth"
    t.float "volume_to_eth"
    t.index ["digital_asset_id"], name: "index_price_histories_on_digital_asset_id"
  end

  add_foreign_key "github_profiles", "digital_assets"
  add_foreign_key "github_repos", "github_profiles"
  add_foreign_key "price_histories", "digital_assets"
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_12_08_214507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "timescaledb"

  create_table "binance_price_pairs", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.float "latest_price_usd"
    t.boolean "watch", default: false
    t.string "watch_schedule"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_binance_price_pairs_on_id", unique: true
  end

  create_table "binance_prices", id: false, force: :cascade do |t|
    t.string "binance_price_pair_id", null: false
    t.datetime "created_at", default: "2022-12-08 21:46:31", null: false
    t.float "price"
    t.index ["binance_price_pair_id", "created_at"], name: "index_binance_prices_on_binance_price_pair_id_and_created_at", unique: true
    t.index ["binance_price_pair_id"], name: "index_binance_prices_on_binance_price_pair_id"
    t.index ["created_at"], name: "binance_prices_created_at_idx", order: :desc
  end

end

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

ActiveRecord::Schema[7.1].define(version: 2024_05_31_135518) do
  create_table "coins", force: :cascade do |t|
    t.string "symbol"
    t.string "show_symbol"
    t.string "name"
    t.integer "rank"
    t.decimal "price"
    t.decimal "market_cap"
    t.decimal "volume_24h"
    t.decimal "delta_24h"
    t.decimal "total_volume_24h"
    t.decimal "low_24h"
    t.decimal "high_24h"
    t.decimal "delta_1h"
    t.decimal "delta_7d"
    t.decimal "delta_30d"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

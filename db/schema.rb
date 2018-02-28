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

ActiveRecord::Schema.define(version: 20180227033312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "vehicle_makes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_model_option_types", force: :cascade do |t|
    t.bigint "vehicle_model_id"
    t.bigint "vehicle_option_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_model_id"], name: "index_vehicle_model_option_types_on_vehicle_model_id"
    t.index ["vehicle_option_type_id"], name: "index_vehicle_model_option_types_on_vehicle_option_type_id"
  end

  create_table "vehicle_models", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "vehicle_make_id"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_vehicle_models_on_vehicle_id"
    t.index ["vehicle_make_id"], name: "index_vehicle_models_on_vehicle_make_id"
  end

  create_table "vehicle_option_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicle_option_values", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "vehicle_option_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_option_type_id"], name: "index_vehicle_option_values_on_vehicle_option_type_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "vehicle_model_option_types", "vehicle_models"
  add_foreign_key "vehicle_model_option_types", "vehicle_option_types"
  add_foreign_key "vehicle_models", "vehicle_makes"
  add_foreign_key "vehicle_models", "vehicles"
  add_foreign_key "vehicle_option_values", "vehicle_option_types"
end

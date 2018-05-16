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

ActiveRecord::Schema.define(version: 20180516171454) do

  create_table "appointments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "from_timestamp"
    t.datetime "to_timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "space_id"
    t.bigint "slot_id"
    t.index ["slot_id"], name: "index_appointments_on_slot_id"
    t.index ["space_id"], name: "index_appointments_on_space_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "devices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "device_id"
    t.boolean "logged_in", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "total", limit: 24
    t.float "advance", limit: 24
    t.float "pending", limit: 24
    t.float "estimate", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "appointment_id"
    t.index ["appointment_id"], name: "index_payments_on_appointment_id"
  end

  create_table "slot_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "count"
    t.float "price", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "space_id"
    t.bigint "slot_type_id"
    t.index ["slot_type_id"], name: "index_slots_on_slot_type_id"
    t.index ["space_id"], name: "index_slots_on_space_id"
  end

  create_table "space_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "img_src"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "space_id"
    t.index ["space_id"], name: "index_space_images_on_space_id"
  end

  create_table "space_ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "rating", limit: 24
    t.bigint "reviewer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_space_ratings_on_user_id"
  end

  create_table "space_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "address"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.text "description"
    t.float "average_rating", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_spaces_on_user_id"
  end

  create_table "user_ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "rating", limit: 24
    t.bigint "reviewer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_user_ratings_on_user_id"
  end

  create_table "user_spaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "space_id"
    t.index ["space_id"], name: "index_user_spaces_on_space_id"
    t.index ["user_id"], name: "index_user_spaces_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "phone_number"
    t.string "password"
    t.string "auth_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pin"
    t.datetime "pin_sent_at"
    t.boolean "verified", default: false
    t.string "otp"
  end

  add_foreign_key "appointments", "slots"
  add_foreign_key "appointments", "spaces"
  add_foreign_key "appointments", "users"
  add_foreign_key "devices", "users"
  add_foreign_key "payments", "appointments"
  add_foreign_key "slots", "slot_types"
  add_foreign_key "slots", "spaces"
  add_foreign_key "space_images", "spaces"
  add_foreign_key "space_ratings", "users"
  add_foreign_key "spaces", "users"
  add_foreign_key "user_ratings", "users"
  add_foreign_key "user_spaces", "spaces"
  add_foreign_key "user_spaces", "users"
end

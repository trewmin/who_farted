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

ActiveRecord::Schema.define(version: 20180101234302) do

  create_table "farts", force: :cascade do |t|
    t.integer "group_id"
    t.integer "smelter_id"
    t.integer "delter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delter_id"], name: "index_farts_on_delter_id"
    t.index ["group_id"], name: "index_farts_on_group_id"
    t.index ["smelter_id"], name: "index_farts_on_smelter_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_groups_on_admin_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

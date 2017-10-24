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

ActiveRecord::Schema.define(version: 20171023164438) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "landline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.bigint "branch_id"
    t.index ["branch_id"], name: "index_branches_on_branch_id"
    t.index ["company_id"], name: "index_branches_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.bigint "mobile"
    t.string "email"
    t.string "designation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "branch_id"
    t.bigint "division_id"
    t.bigint "company_id"
    t.index ["branch_id"], name: "index_contacts_on_branch_id"
    t.index ["company_id"], name: "index_contacts_on_company_id"
    t.index ["division_id"], name: "index_contacts_on_division_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.bigint "division_id"
    t.index ["company_id"], name: "index_divisions_on_company_id"
    t.index ["division_id"], name: "index_divisions_on_division_id"
  end

  add_foreign_key "branches", "branches"
  add_foreign_key "branches", "companies"
  add_foreign_key "contacts", "branches"
  add_foreign_key "contacts", "companies"
  add_foreign_key "contacts", "divisions"
  add_foreign_key "divisions", "companies"
  add_foreign_key "divisions", "divisions"
end

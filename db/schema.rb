# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20190814235738) do

  create_table "actives", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "lawsuit_id"
    t.datetime "appointment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "actives", ["contact_id"], name: "index_actives_on_contact_id"
  add_index "actives", ["lawsuit_id"], name: "index_actives_on_lawsuit_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "cpf"
    t.string   "rg"
    t.string   "birthdate"
    t.integer  "profession_id"
    t.integer  "marital_status_id"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.string   "district"
    t.string   "number"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "contacts", ["marital_status_id"], name: "index_contacts_on_marital_status_id"
  add_index "contacts", ["profession_id"], name: "index_contacts_on_profession_id"

  create_table "forums", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lawsuits", force: :cascade do |t|
    t.integer  "forum_id"
    t.integer  "lawyer_id"
    t.decimal  "fees"
    t.string   "autos"
    t.string   "conciliation_date"
    t.string   "instruction_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "lawsuits", ["forum_id"], name: "index_lawsuits_on_forum_id"
  add_index "lawsuits", ["lawyer_id"], name: "index_lawsuits_on_lawyer_id"

  create_table "lawyers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marital_statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "phones", ["contact_id"], name: "index_phones_on_contact_id"

  create_table "professions", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "recievers", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "lawsuit_id"
    t.datetime "appointment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recievers", ["contact_id"], name: "index_recievers_on_contact_id"
  add_index "recievers", ["lawsuit_id"], name: "index_recievers_on_lawsuit_id"

end

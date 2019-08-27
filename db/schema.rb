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

ActiveRecord::Schema.define(version: 20190825005026) do

  create_table "dashboard_actives", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "lawsuit_id"
    t.datetime "appointment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dashboard_actives", ["contact_id"], name: "index_dashboard_actives_on_contact_id"
  add_index "dashboard_actives", ["lawsuit_id"], name: "index_dashboard_actives_on_lawsuit_id"

  create_table "dashboard_contacts", force: :cascade do |t|
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

  add_index "dashboard_contacts", ["marital_status_id"], name: "index_dashboard_contacts_on_marital_status_id"
  add_index "dashboard_contacts", ["profession_id"], name: "index_dashboard_contacts_on_profession_id"

  create_table "dashboard_dummies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboard_forums", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboard_lawsuits", force: :cascade do |t|
    t.integer  "forum_id"
    t.integer  "lawyer_id"
    t.decimal  "fees"
    t.string   "autos"
    t.datetime "conciliation_date"
    t.datetime "instruction_date"
    t.datetime "interrogation_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "dashboard_lawsuits", ["forum_id"], name: "index_dashboard_lawsuits_on_forum_id"
  add_index "dashboard_lawsuits", ["lawyer_id"], name: "index_dashboard_lawsuits_on_lawyer_id"

  create_table "dashboard_lawyers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboard_marital_statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dashboard_phones", force: :cascade do |t|
    t.string   "number"
    t.integer  "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dashboard_phones", ["contact_id"], name: "index_dashboard_phones_on_contact_id"

  create_table "dashboard_professions", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dashboard_recievers", force: :cascade do |t|
    t.integer  "contact_id"
    t.integer  "lawsuit_id"
    t.datetime "appointment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dashboard_recievers", ["contact_id"], name: "index_dashboard_recievers_on_contact_id"
  add_index "dashboard_recievers", ["lawsuit_id"], name: "index_dashboard_recievers_on_lawsuit_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end

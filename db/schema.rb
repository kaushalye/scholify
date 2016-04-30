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

ActiveRecord::Schema.define(version: 20160426075939) do

  create_table "donations", force: :cascade do |t|
    t.integer  "sponsor_id",     limit: 4
    t.integer  "scholarship_id", limit: 4
    t.decimal  "amount",                   precision: 10
    t.date     "valid_from"
    t.integer  "num_of_months",  limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "donations", ["scholarship_id"], name: "index_donations_on_scholarship_id", using: :btree
  add_index "donations", ["sponsor_id"], name: "index_donations_on_sponsor_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "student_id",     limit: 4
    t.integer  "scholarship_id", limit: 4
    t.decimal  "amount",                       precision: 10
    t.string   "from_account",   limit: 255
    t.string   "to_account",     limit: 255
    t.string   "external_ref",   limit: 255
    t.text     "notes",          limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "payments", ["scholarship_id"], name: "index_payments_on_scholarship_id", using: :btree
  add_index "payments", ["student_id"], name: "index_payments_on_student_id", using: :btree

  create_table "scholarships", force: :cascade do |t|
    t.decimal  "amount",                 precision: 10
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status",     limit: 255
    t.integer  "sponsor_id", limit: 4
    t.integer  "student_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "scholarships", ["sponsor_id"], name: "index_scholarships_on_sponsor_id", using: :btree
  add_index "scholarships", ["student_id"], name: "index_scholarships_on_student_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.text     "address",    limit: 65535
    t.string   "faculty",    limit: 255
    t.string   "department", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end

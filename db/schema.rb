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

ActiveRecord::Schema.define(version: 20160515082846) do

  create_table "bulk_transactions", force: :cascade do |t|
    t.date     "settled_date"
    t.string   "sender",           limit: 255
    t.decimal  "amount",                         precision: 10
    t.decimal  "amount_lkr",                     precision: 10
    t.decimal  "rate",                           precision: 10
    t.date     "bank_date"
    t.string   "chq_no",           limit: 255
    t.string   "bank_acc",         limit: 255
    t.string   "beneficiary",      limit: 255
    t.text     "notes",            limit: 65535
    t.integer  "effective_year",   limit: 4
    t.integer  "effective_months", limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

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
    t.integer  "student_id",           limit: 4
    t.integer  "scholarship_id",       limit: 4
    t.decimal  "amount",                             precision: 10
    t.string   "from_account",         limit: 255
    t.string   "to_account",           limit: 255
    t.string   "external_ref",         limit: 255
    t.text     "notes",                limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "bulk_transactions_id", limit: 4
    t.integer  "month",                limit: 4
    t.integer  "year",                 limit: 4
  end

  add_index "payments", ["bulk_transactions_id"], name: "index_payments_on_bulk_transactions_id", using: :btree
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

  create_table "users", force: :cascade do |t|
    t.string   "provider",   limit: 255, null: false
    t.string   "uid",        limit: 255, null: false
    t.string   "name",       limit: 255
    t.string   "location",   limit: 255
    t.string   "image_url",  limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end

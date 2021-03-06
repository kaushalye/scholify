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

ActiveRecord::Schema.define(version: 20201229112035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bad_debts", force: :cascade do |t|
    t.date     "eff_date"
    t.decimal  "amount"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sponsor_id"
    t.index ["sponsor_id"], name: "index_bad_debts_on_sponsor_id", using: :btree
  end

  create_table "bulk_transactions", force: :cascade do |t|
    t.date     "settled_date"
    t.string   "sender"
    t.decimal  "amount"
    t.decimal  "amount_lkr"
    t.decimal  "rate"
    t.date     "bank_date"
    t.string   "chq_no"
    t.string   "bank_acc"
    t.string   "beneficiary"
    t.text     "notes"
    t.integer  "effective_year"
    t.integer  "effective_months"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "sponsor_id"
    t.integer  "scholarship_id"
    t.decimal  "amount"
    t.date     "valid_from"
    t.integer  "num_of_months"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "bank_date"
    t.string   "account"
    t.index ["scholarship_id"], name: "index_donations_on_scholarship_id", using: :btree
    t.index ["sponsor_id"], name: "index_donations_on_sponsor_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "scholarship_id"
    t.decimal  "amount"
    t.string   "to_account"
    t.text     "notes"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "bulk_transaction_id"
    t.decimal  "amount_aud"
    t.integer  "effective_year"
    t.string   "effective_month"
    t.date     "bank_date"
    t.index ["bulk_transaction_id"], name: "index_payments_on_bulk_transaction_id", using: :btree
    t.index ["scholarship_id"], name: "index_payments_on_scholarship_id", using: :btree
  end

  create_table "scholarships", force: :cascade do |t|
    t.decimal  "amount"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.integer  "sponsor_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sponsor_id"], name: "index_scholarships_on_sponsor_id", using: :btree
    t.index ["student_id"], name: "index_scholarships_on_student_id", using: :btree
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_feedbacks", force: :cascade do |t|
    t.datetime "timestamp"
    t.integer  "renew_year"
    t.text     "academic_progress"
    t.text     "comments"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "student_id"
    t.string   "email"
    t.index ["student_id"], name: "index_student_feedbacks_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.string   "faculty"
    t.string   "department"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "account_name"
    t.string   "bank"
    t.string   "branch"
    t.string   "branch_no"
    t.string   "account_no"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.string   "name"
    t.string   "location"
    t.string   "image_url"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
    t.index ["provider"], name: "index_users_on_provider", using: :btree
    t.index ["uid"], name: "index_users_on_uid", using: :btree
  end

  add_foreign_key "bad_debts", "sponsors"
  add_foreign_key "payments", "bulk_transactions"
  add_foreign_key "student_feedbacks", "students"
end

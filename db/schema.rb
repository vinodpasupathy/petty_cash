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

ActiveRecord::Schema.define(version: 20160706100859) do

  create_table "banks", force: :cascade do |t|
    t.string   "bank_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "debits", force: :cascade do |t|
    t.string   "date"
    t.string   "mode_of_payment"
    t.string   "cheque_no"
    t.string   "bank"
    t.string   "cheque"
    t.string   "amount"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "total_expenses"
    t.integer  "opening_balance"
    t.string   "credit_narration"
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string   "expense_category_list"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "narrate_expense"
    t.string   "voucher"
    t.string   "total"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "expense_type"
    t.date     "date"
    t.string   "claimed_by"
    t.string   "claim_status"
    t.integer  "approved_amount"
    t.string   "pay_status"
    t.string   "from_date"
    t.string   "to_date"
    t.string   "approved_by"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "role"
    t.string   "phone"
    t.string   "user_status"
    t.integer  "advance_amount"
  end

end

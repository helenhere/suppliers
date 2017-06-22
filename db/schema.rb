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

ActiveRecord::Schema.define(version: 20170620094146) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "city_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "datetime_of_purchase"
    t.integer  "city_id"
    t.integer  "customer_id"
    t.integer  "supplier_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "product_name"
    t.string   "phone"
    t.string   "company"
    t.integer  "city_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end

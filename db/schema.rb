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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110818020002) do

  create_table "consumers", :force => true do |t|
    t.string   "wedding_month"
    t.integer  "wedding_year"
    t.string   "postal_code"
    t.integer  "authenticateable_id"
    t.string   "authenticateable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.datetime "live_at"
    t.integer  "merchant_id"
    t.text     "copy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "copy_header"
    t.text     "copy_subheader"
  end

  create_table "merchants", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "contact_name"
    t.text     "address"
    t.integer  "authenticateable_id"
    t.string   "authenticateable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchased_deals", :force => true do |t|
    t.integer  "consumer_id"
    t.integer  "deal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
    t.datetime "redeemed_at"
    t.datetime "refund_requested_at"
  end

  add_index "purchased_deals", ["identifier"], :name => "index_purchased_deals_on_identifier"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",    :limit => 128
    t.string   "salt",                  :limit => 128
    t.string   "confirmation_token",    :limit => 128
    t.string   "remember_token",        :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "authenticateable_id"
    t.string   "authenticateable_type"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end

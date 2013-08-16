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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130816064536) do

  create_table "admins", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "menuitems", :force => true do |t|
    t.string   "itemname"
    t.decimal  "itemunitprice"
    t.string   "itemcategory"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "restaurant_id"
  end

  create_table "orderitems", :force => true do |t|
    t.string   "itemname"
    t.integer  "quantity"
    t.integer  "itemprice"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "restaurant_id"
    t.integer  "order_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "customername"
    t.integer  "custoemrnumber"
    t.text     "customeraddress"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "restaurant_id"
    t.integer  "total"
    t.string   "customeremail"
    t.integer  "user_id"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "restusername"
    t.string   "restname"
    t.string   "restaddressline1"
    t.string   "restaddressline2"
    t.integer  "restphone"
    t.time     "resttimingfrom"
    t.time     "resttiminigto"
    t.string   "restdeltime"
    t.string   "restdelmin"
    t.text     "restabout"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "restemail"
    t.string   "city"
    t.string   "deliveryarea"
    t.boolean  "delivers"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "reviews", :force => true do |t|
    t.string   "title"
    t.text     "reviewtext"
    t.string   "author"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                            :null => false
    t.datetime "updated_at",                                            :null => false
    t.string   "userfullname"
    t.decimal  "userphonenumber"
    t.string   "useraddress"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

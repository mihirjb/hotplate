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

ActiveRecord::Schema.define(:version => 20130905155852) do

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

  create_table "assets", :force => true do |t|
    t.integer  "restaurant_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "beentheres", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "blorescrapurls", :force => true do |t|
    t.string   "tkurl"
    t.string   "zurl"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "favorites", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "jampotentialusers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "menuitems", :force => true do |t|
    t.string   "itemname"
    t.decimal  "itemunitprice"
    t.string   "itemcategory"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "restaurant_id"
    t.string   "itemdesc"
  end

  create_table "mumscrapurls", :force => true do |t|
    t.string   "tkurl"
    t.string   "zurl"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orderitems", :force => true do |t|
    t.string   "itemname"
    t.integer  "quantity"
    t.integer  "itemprice"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "restaurant_id"
    t.integer  "order_id"
    t.text     "specialinstruction"
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
    t.string   "customernumber"
  end

  create_table "potentialusers", :force => true do |t|
    t.string   "email"
    t.integer  "restaurant_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "punescrapurls", :force => true do |t|
    t.string   "tkurl"
    t.string   "zurl"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "restaurants", :force => true do |t|
    t.string   "restusername"
    t.string   "restname"
    t.integer  "restphone"
    t.time     "resttimingfrom"
    t.string   "restdeltime"
    t.string   "restdelmin"
    t.text     "restabout"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "restemail"
    t.string   "city"
    t.string   "deliveryarea"
    t.boolean  "delivers"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "raddress"
    t.string   "rtimings"
    t.integer  "rdelradius"
    t.string   "rarea"
    t.integer  "rcost"
    t.boolean  "gmaps"
    t.boolean  "onlyveg"
    t.string   "rfeatures"
    t.string   "rcuisine"
    t.string   "slug"
  end

  add_index "restaurants", ["slug"], :name => "index_restaurants_on_slug"

  create_table "reviews", :force => true do |t|
    t.string   "title"
    t.text     "reviewtext"
    t.string   "author"
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "score"
    t.string   "status"
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
    t.string   "useraddress"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "userphonenumber"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

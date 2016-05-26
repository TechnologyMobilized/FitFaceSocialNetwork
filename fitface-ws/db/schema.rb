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

ActiveRecord::Schema.define(:version => 20160324034635) do

  create_table "blocks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "report_id"
    t.boolean  "is_report",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "check_ins", :force => true do |t|
    t.integer  "user_id"
    t.integer  "gym_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude",   :default => 0.0,  :null => false
    t.float    "longitude",  :default => 0.0,  :null => false
    t.boolean  "is_active",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gyms", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude",       :default => 0.0,  :null => false
    t.float    "longitude",      :default => 0.0,  :null => false
    t.string   "contact_number"
    t.boolean  "is_active",      :default => true
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "motivates", :force => true do |t|
    t.integer  "user_id"
    t.string   "url"
    t.boolean  "is_video",   :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "outdoor_places", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.float    "latitude",       :default => 0.0,  :null => false
    t.float    "longitude",      :default => 0.0,  :null => false
    t.string   "contact_number"
    t.boolean  "is_active",      :default => true
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "image"
    t.boolean  "is_profile", :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "user_id"
  end

  create_table "sports", :force => true do |t|
    t.string   "name"
    t.boolean  "is_active",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "user_events", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_gyms", :force => true do |t|
    t.integer  "user_id"
    t.integer  "gym_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_outdoor_places", :force => true do |t|
    t.integer  "user_id"
    t.integer  "outdoor_place_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "user_preferences", :force => true do |t|
    t.integer  "user_id"
    t.integer  "turn_on_day"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_sports", :force => true do |t|
    t.integer  "user_id"
    t.integer  "sport_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_workouts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "workout_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "name"
    t.integer  "age"
    t.integer  "sex"
    t.string   "city"
    t.string   "zip_code"
    t.string   "username",                                  :null => false
    t.integer  "security_question"
    t.string   "security_answer"
    t.string   "access_token"
    t.string   "device_token"
    t.integer  "status"
    t.boolean  "is_active",              :default => true
    t.boolean  "notify_sms",             :default => true
    t.boolean  "notify_email",           :default => true
    t.boolean  "notify_new_msg",         :default => true
    t.boolean  "meet_now",               :default => false
    t.integer  "logged_day"
    t.boolean  "is_disable",             :default => false
    t.boolean  "notify_via_app",         :default => true
    t.boolean  "notify_via_sms",         :default => false
    t.boolean  "notify_via_email",       :default => false
    t.integer  "turn_off_time"
    t.string   "turn_on_start"
    t.string   "turn_on_end"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "workouts", :force => true do |t|
    t.string   "name"
    t.boolean  "is_active",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

end

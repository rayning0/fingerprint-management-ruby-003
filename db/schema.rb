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

ActiveRecord::Schema.define(:version => 20131115194643) do

  create_table "criminal_histories", :force => true do |t|
    t.integer "person_id"
    t.integer "incident_type_id"
  end

  add_index "criminal_histories", ["incident_type_id"], :name => "index_criminal_histories_on_incident_type_id"
  add_index "criminal_histories", ["person_id"], :name => "index_criminal_histories_on_person_id"

  create_table "fingerprint_databases", :force => true do |t|
    t.string "name"
    t.string "owner"
  end

  create_table "fingerprint_scanners", :force => true do |t|
    t.string "location"
  end

  create_table "fingerprints", :force => true do |t|
    t.integer "fingerprint_database_id"
    t.integer "person_id"
    t.string  "fingerprint_image_url"
  end

  add_index "fingerprints", ["fingerprint_database_id"], :name => "index_fingerprints_on_database_id"
  add_index "fingerprints", ["person_id"], :name => "index_fingerprints_on_person_id"

  create_table "incident_types", :force => true do |t|
    t.string "name"
  end

  create_table "people", :force => true do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "scanned_fingerprints", :force => true do |t|
    t.integer "fingerprint_scanner_id"
    t.integer "fingerprint_id"
  end

  add_index "scanned_fingerprints", ["fingerprint_id"], :name => "index_scanned_fingerprints_on_fingerprint_id"
  add_index "scanned_fingerprints", ["fingerprint_scanner_id"], :name => "index_scanned_fingerprints_on_fingerprint_scanner_id"

end

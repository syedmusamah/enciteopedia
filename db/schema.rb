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

ActiveRecord::Schema.define(:version => 20120427172240) do

  create_table "aeditors", :force => true do |t|
    t.integer  "eid"
    t.integer  "aid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aeors", :force => true do |t|
    t.integer  "editor_id",  :null => false
    t.integer  "article_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "arteditors", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.string   "aName"
    t.string   "Category"
    t.text     "content"
    t.integer  "hits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "cName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "editors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "thumbs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
  end

  create_table "flaggings", :force => true do |t|
    t.string   "flaggable_type"
    t.integer  "flaggable_id"
    t.string   "flagger_type"
    t.integer  "flagger_id"
    t.string   "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flaggings", ["flag", "flaggable_type", "flaggable_id"], :name => "index_flaggings_on_flag_and_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flag", "flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], :name => "access_flag_flaggings"
  add_index "flaggings", ["flaggable_type", "flaggable_id"], :name => "index_flaggings_on_flaggable_type_and_flaggable_id"
  add_index "flaggings", ["flagger_type", "flagger_id", "flaggable_type", "flaggable_id"], :name => "access_flaggings"

  create_table "histories", :force => true do |t|
    t.integer  "editor_id",       :null => false
    t.integer  "article_id",      :null => false
    t.string   "article_Content", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hists", :force => true do |t|
    t.integer  "editor_id",       :null => false
    t.integer  "article_id",      :null => false
    t.string   "article_content", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "veditors", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.text     "reason"
    t.string   "p"
  end

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end

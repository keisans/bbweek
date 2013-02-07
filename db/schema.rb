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

ActiveRecord::Schema.define(:version => 20130207162816) do

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "job"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ghosts", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "game"
    t.string   "color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "monsters", :force => true do |t|
    t.string   "name"
    t.integer  "max_hp"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "intelligence"
    t.integer  "defense"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "current_hp"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.string   "damage"
    t.string   "attribute"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "monster_id"
  end

end

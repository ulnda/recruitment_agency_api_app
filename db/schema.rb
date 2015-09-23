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

ActiveRecord::Schema.define(version: 20150923113849) do

  create_table "employee_skills", force: true do |t|
    t.integer  "employee_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employee_skills", ["employee_id", "skill_id"], name: "index_employee_skills_on_employee_and_skill", unique: true
  add_index "employee_skills", ["employee_id"], name: "index_employee_skills_on_employee_id"
  add_index "employee_skills", ["skill_id"], name: "index_employee_skills_on_skill_id"

  create_table "employees", force: true do |t|
    t.string   "name",                         null: false
    t.string   "contact_info",                 null: false
    t.boolean  "job_search",   default: false, null: false
    t.integer  "salary",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["title"], name: "index_skills_on_title", unique: true

end

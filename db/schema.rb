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

ActiveRecord::Schema.define(:version => 20130717142243) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authors", :force => true do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "ects"
    t.string   "time"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "enrollments", :force => true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.date     "enrollment_date"
    t.date     "completion_date"
  end

  create_table "phd_supervisor_relations", :force => true do |t|
    t.integer  "phd_id"
    t.integer  "supervisor_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "progresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "milestone"
    t.date     "plandate"
    t.date     "completedate"
    t.string   "name"
    t.string   "content_type"
    t.binary   "data",         :limit => 10485760
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "role_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "supervisor_progress_declarations", :force => true do |t|
    t.date     "date"
    t.boolean  "scientific_progress"
    t.boolean  "following_student_plan"
    t.integer  "phd_id"
    t.integer  "supervisor_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "role_id"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end

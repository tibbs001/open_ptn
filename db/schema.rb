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

ActiveRecord::Schema.define(version: 20170405173125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "studies", force: :cascade do |t|
    t.string   "nct_id"
    t.string   "status"
    t.string   "title"
    t.string   "brief_summary"
    t.text     "detailed_description"
    t.string   "url"
    t.string   "submitter_name"
    t.string   "contact_info"
    t.string   "email"
    t.binary   "image"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "study_attachments", force: :cascade do |t|
    t.integer  "study_id"
    t.string   "file_name"
    t.string   "content_type"
    t.binary   "file_contents"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end

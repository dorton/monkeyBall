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

ActiveRecord::Schema.define(version: 20160825204150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohort_starts", force: :cascade do |t|
    t.integer  "start_date_id"
    t.integer  "cohort_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["cohort_id"], name: "index_cohort_starts_on_cohort_id", using: :btree
    t.index ["start_date_id"], name: "index_cohort_starts_on_start_date_id", using: :btree
  end

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monkeys", force: :cascade do |t|
    t.string   "email"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "expectations"
    t.string   "learning_accommodations"
    t.string   "live_problem_solving"
    t.string   "efforts_to_date"
    t.string   "current_skills"
    t.string   "years_employment"
    t.string   "weekly_hours_work"
    t.boolean  "graduated"
    t.string   "week_dropped"
    t.string   "outgoing_skills"
    t.boolean  "job_placement_6_months"
    t.boolean  "expectation_fulfillment"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "school_id"
    t.integer  "cohort_id"
    t.integer  "start_date_id"
  end

  create_table "school_cohorts", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_school_cohorts_on_cohort_id", using: :btree
    t.index ["school_id"], name: "index_school_cohorts_on_school_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "start_dates", force: :cascade do |t|
    t.date     "start_date"
    t.integer  "cohort_id"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_start_dates_on_cohort_id", using: :btree
    t.index ["school_id"], name: "index_start_dates_on_school_id", using: :btree
  end

  create_table "user_schools", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_user_schools_on_school_id", using: :btree
    t.index ["user_id"], name: "index_user_schools_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cohort_starts", "cohorts"
  add_foreign_key "cohort_starts", "start_dates"
  add_foreign_key "school_cohorts", "cohorts"
  add_foreign_key "school_cohorts", "schools"
  add_foreign_key "start_dates", "cohorts"
  add_foreign_key "start_dates", "schools"
  add_foreign_key "user_schools", "schools"
  add_foreign_key "user_schools", "users"
end

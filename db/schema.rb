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

ActiveRecord::Schema.define(version: 20170723182425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment"
    t.boolean  "action_required"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "goal_id"
    t.index ["goal_id"], name: "index_comments_on_goal_id", using: :btree
    t.index ["project_id"], name: "index_comments_on_project_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "completion_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feeds", force: :cascade do |t|
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "project_id"
    t.index ["project_id"], name: "index_feeds_on_project_id", using: :btree
    t.index ["user_id"], name: "index_feeds_on_user_id", using: :btree
  end

  create_table "goals", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "project_id"
    t.integer  "completion_status_id"
    t.index ["completion_status_id"], name: "index_goals_on_completion_status_id", using: :btree
    t.index ["project_id"], name: "index_goals_on_project_id", using: :btree
  end

  create_table "overall_averages", force: :cascade do |t|
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_skills", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "project_id"
    t.index ["project_id"], name: "index_project_skills_on_project_id", using: :btree
    t.index ["skill_id"], name: "index_project_skills_on_skill_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.date     "start_date"
    t.date     "finish_date"
    t.boolean  "public"
    t.string   "project_url"
    t.string   "summary"
    t.string   "mentee_feedback"
    t.string   "mentor_feedback"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "mentor_pending"
    t.boolean  "mentee_pending"
    t.integer  "completion_status_id"
    t.integer  "mentee_id"
    t.integer  "mentor_id"
    t.index ["completion_status_id"], name: "index_projects_on_completion_status_id", using: :btree
    t.index ["mentee_id"], name: "index_projects_on_mentee_id", using: :btree
    t.index ["mentor_id"], name: "index_projects_on_mentor_id", using: :btree
  end

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
    t.index ["rater_id"], name: "index_rates_on_rater_id", using: :btree
  end

  create_table "rating_caches", force: :cascade do |t|
    t.string   "cacheable_type"
    t.integer  "cacheable_id"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "availability"
    t.integer  "accuracy"
    t.integer  "project_id"
    t.integer  "giver_id"
    t.integer  "receiver_id"
    t.index ["giver_id"], name: "index_ratings_on_giver_id", using: :btree
    t.index ["project_id"], name: "index_ratings_on_project_id", using: :btree
    t.index ["receiver_id"], name: "index_ratings_on_receiver_id", using: :btree
  end

  create_table "skill_users", force: :cascade do |t|
    t.boolean "mentor"
    t.integer "skill_id"
    t.integer "user_id"
    t.index ["skill_id"], name: "index_skill_users_on_skill_id", using: :btree
    t.index ["user_id"], name: "index_skill_users_on_user_id", using: :btree
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "skill_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "location"
    t.string   "linkedin_url"
    t.string   "github_url"
    t.string   "other_site"
    t.string   "twitter"
    t.string   "slack_name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "comments", "goals"
  add_foreign_key "comments", "projects"
  add_foreign_key "comments", "users"
  add_foreign_key "feeds", "projects"
  add_foreign_key "feeds", "users"
  add_foreign_key "goals", "completion_statuses"
  add_foreign_key "goals", "projects"
  add_foreign_key "project_skills", "projects"
  add_foreign_key "project_skills", "skills"
  add_foreign_key "projects", "completion_statuses"
  add_foreign_key "ratings", "projects"
  add_foreign_key "skill_users", "skills"
  add_foreign_key "skill_users", "users"
end

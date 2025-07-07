# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_07_07_133153) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certifications", force: :cascade do |t|
    t.string "name"
    t.string "issuer"
    t.string "date"
    t.bigint "cv_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_certifications_on_cv_id"
  end

  create_table "cvs", force: :cascade do |t|
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "education_items", force: :cascade do |t|
    t.string "institution"
    t.string "program"
    t.string "location"
    t.string "date"
    t.string "qualification"
    t.text "details"
    t.bigint "cv_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_education_items_on_cv_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "role"
    t.string "company"
    t.string "job_type"
    t.string "location"
    t.string "date"
    t.text "responsibilities"
    t.bigint "cv_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_experiences_on_cv_id"
  end

  create_table "mains", force: :cascade do |t|
    t.string "CV"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_infos", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "email"
    t.string "phone"
    t.string "location"
    t.string "linkedin"
    t.string "github"
    t.bigint "cv_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_personal_infos_on_cv_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "subtitle"
    t.string "status"
    t.string "date"
    t.text "description"
    t.text "highlights"
    t.string "github"
    t.bigint "cv_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_projects_on_cv_id"
  end

  create_table "spoken_languages", force: :cascade do |t|
    t.string "language"
    t.string "level"
    t.bigint "cv_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_spoken_languages_on_cv_id"
  end

  create_table "technical_skills", force: :cascade do |t|
    t.string "languages"
    t.string "frameworks"
    t.string "tools"
    t.bigint "cv_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_technical_skills_on_cv_id"
  end

  add_foreign_key "certifications", "cvs"
  add_foreign_key "education_items", "cvs"
  add_foreign_key "experiences", "cvs"
  add_foreign_key "personal_infos", "cvs"
  add_foreign_key "projects", "cvs"
  add_foreign_key "spoken_languages", "cvs"
  add_foreign_key "technical_skills", "cvs"
end

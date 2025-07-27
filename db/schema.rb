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

ActiveRecord::Schema[7.1].define(version: 2025_07_27_154802) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certifications", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "issuer"
    t.date "date"
    t.bigint "cv_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_certifications_on_cv_id"
  end

  create_table "cvs", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "location"
    t.string "date"
    t.text "details"
    t.bigint "cv_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_educations_on_cv_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "cv_id", null: false
    t.string "name"
    t.string "location"
    t.date "date"
    t.text "details"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_experiences_on_cv_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "title"
    t.string "language"
    t.string "level"
    t.bigint "cv_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_languages_on_cv_id"
  end

  create_table "personal_infos", force: :cascade do |t|
    t.bigint "cv_id", null: false
    t.string "title"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "location"
    t.string "linkedin"
    t.string "github"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_personal_infos_on_cv_id"
  end

  create_table "projects", force: :cascade do |t|
    t.bigint "cv_id", null: false
    t.string "title"
    t.string "name"
    t.string "date"
    t.text "description"
    t.text "highlights"
    t.string "github"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_projects_on_cv_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "title"
    t.bigint "cv_id", null: false
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_skills_on_cv_id"
  end

  create_table "summaries", force: :cascade do |t|
    t.bigint "cv_id", null: false
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cv_id"], name: "index_summaries_on_cv_id"
  end

  add_foreign_key "certifications", "cvs"
  add_foreign_key "educations", "cvs"
  add_foreign_key "experiences", "cvs"
  add_foreign_key "languages", "cvs"
  add_foreign_key "personal_infos", "cvs"
  add_foreign_key "projects", "cvs"
  add_foreign_key "skills", "cvs"
  add_foreign_key "summaries", "cvs"
end

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

ActiveRecord::Schema.define(version: 2019_12_16_162123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.bigint "course_id"
    t.string "name"
    t.jsonb "content"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_challenges_on_course_id"
  end

  create_table "course_students", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "course_id"
    t.string "aasm_state"
    t.index ["course_id"], name: "index_course_students_on_course_id"
    t.index ["student_id"], name: "index_course_students_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "teacher_id"
    t.string "name"
    t.integer "time_load"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_challenges", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "challenge_id"
    t.integer "score"
    t.index ["challenge_id"], name: "index_student_challenges_on_challenge_id"
    t.index ["student_id"], name: "index_student_challenges_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "surname"
    t.date "birthdate"
    t.string "address"
    t.string "email"
    t.integer "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_28_184741) do

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_courses_on_title", unique: true
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index "\"course\"", name: "index_enrollments_on_course"
    t.index "\"teacher\"", name: "index_enrollments_on_teacher"
    t.index ["course_id", "teacher_id"], name: "index_enrollments_on_course_id_and_teacher_id", unique: true
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["teacher_id"], name: "index_enrollments_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
  end

  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "teachers"
end

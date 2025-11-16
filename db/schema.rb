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

ActiveRecord::Schema[8.1].define(version: 2025_11_16_160437) do
  create_table "exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "plan_exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "exercise_id", null: false
    t.integer "position"
    t.datetime "updated_at", null: false
    t.integer "workout_plan_id", null: false
    t.index ["exercise_id"], name: "index_plan_exercises_on_exercise_id"
    t.index ["workout_plan_id"], name: "index_plan_exercises_on_workout_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "exercise_id", null: false
    t.integer "position"
    t.datetime "updated_at", null: false
    t.integer "workout_id", null: false
    t.index ["exercise_id"], name: "index_workout_exercises_on_exercise_id"
    t.index ["workout_id"], name: "index_workout_exercises_on_workout_id"
  end

  create_table "workout_plans", force: :cascade do |t|
    t.text "comment"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_workout_plans_on_user_id"
  end

  create_table "workout_sets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "note"
    t.integer "reps"
    t.integer "set_number"
    t.datetime "updated_at", null: false
    t.float "weight_kg"
    t.integer "workout_exercise_id", null: false
    t.index ["workout_exercise_id"], name: "index_workout_sets_on_workout_exercise_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.date "workout_date"
    t.integer "workout_plan_id", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
    t.index ["workout_plan_id"], name: "index_workouts_on_workout_plan_id"
  end

  add_foreign_key "plan_exercises", "exercises"
  add_foreign_key "plan_exercises", "workout_plans"
  add_foreign_key "workout_exercises", "exercises"
  add_foreign_key "workout_exercises", "workouts"
  add_foreign_key "workout_plans", "users"
  add_foreign_key "workout_sets", "workout_exercises"
  add_foreign_key "workouts", "users"
  add_foreign_key "workouts", "workout_plans"
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating a test environment..."


# destroy all first
puts "deleting all old Users and Workouts first ..."
User.destroy_all
Workout.destroy_all
WorkoutPlan.destroy_all

# need to create a user
user = User.create!(first_name: "Lorenz", last_name: "mayer", email: "lol@lol.de")

# user needs to create a workout plan
plan = user.workout_plans.create!(name: "Upper Body")

# user adds exercises to his workout plan
puts "Ensuring base exercises exist..."
bench_press = Exercise.find_or_create_by!(name: "Bench Press")
push_ups    = Exercise.find_or_create_by!(name: "Push-Up")

plan.plan_exercises.create!(exercise: bench_press, position: 1)
plan.plan_exercises.create!(exercise: push_ups, position: 2)

# create a workout and model workout exercises
workout = user.workouts.create!(workout_plan: plan, workout_date: Date.today)
we_1 = workout.workout_exercises.create!(exercise: bench_press, position: 1)
we_2 = workout.workout_exercises.create!(exercise: push_ups, position: 2)

# start tracking bench press
we_1.workout_sets.create!(set_number: 1, reps: 8, weight_kg: 60)
we_1.workout_sets.create!(set_number: 2, reps: 4, weight_kg: 80)

# start tracking pushups
we_2.workout_sets.create!(set_number: 1, reps: 8, weight_kg: 60)

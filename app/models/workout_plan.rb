class WorkoutPlan < ApplicationRecord
  belongs_to :user, inverse_of: :workout_plans
  has_many :plan_exercises, inverse_of: :workout_plans
end
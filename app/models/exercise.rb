class Exercise < ApplicationRecord
  has_many :plan_exercises,        dependent: :restrict_with_error
  has_many :workout_exercises,     dependent: :restrict_with_error

  has_many :workout_plans, through: :plan_exercises
  has_many :workouts,       through: :workout_exercises

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  # users can't delete an exercise
  before_destroy :prevent_delete
end

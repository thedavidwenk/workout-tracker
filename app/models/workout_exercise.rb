class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  has_many :workout_sets, dependent: :destroy

  accepts_nested_attributes_for :workout_sets
end

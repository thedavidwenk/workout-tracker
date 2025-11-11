class WorkoutSet < ApplicationRecord
  belongs_to :workout_exercise
  has_many :exercises
end

class WorkoutExercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise

  has_many :workout_sets,
           dependent: :destroy

  validates :position,
          presence: true,
          numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end

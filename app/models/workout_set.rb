class WorkoutSet < ApplicationRecord
  belongs_to :workout_exercise

  validates :set_number,
            numericality: { greater_than: 0, allow_nil: true }

  validates :reps,
            numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  validates :weight_kg,
            numericality: { greater_than_or_equal_to: 0, allow_nil: true }
end

class WorkoutSet < ApplicationRecord
  belongs_to :workout_exercise, inverse_of: :workout_sets

  validates :set_index,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }

  validates :reps,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :weight_kg,
            numericality: { greater_than_or_equal_to: 0 }
end
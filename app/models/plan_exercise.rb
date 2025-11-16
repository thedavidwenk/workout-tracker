class PlanExercise < ApplicationRecord
  belongs_to :workout_plan
  belongs_to :exercise

  validates :position,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
end

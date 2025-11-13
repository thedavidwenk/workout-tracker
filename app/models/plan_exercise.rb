class PlanExercise < ApplicationRecord
  belongs_to :exercise,      inverse_of: :plan_exercises
  belongs_to :workout_plan,  inverse_of: :plan_exercises

  validates :position,
            presence: true,
            numericality: { only_integer: true, greater_than: 0 }
end

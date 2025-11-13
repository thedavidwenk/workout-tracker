class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :workout_plan

  has_many :workout_exercises, dependent: :destroy, inverse_of: :workout

  validates :date, presence: true
end

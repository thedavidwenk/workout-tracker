class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :workout_plan

  has_many :workout_exercises, dependent: :destroy
  validates :workout_date, presence: true
end
class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :workout_plan

  has_many :workout_exercises, dependent: :destroy
  has_many :workout_sets, through: :workout_exercises

  accepts_nested_attributes_for :workout_exercises
end
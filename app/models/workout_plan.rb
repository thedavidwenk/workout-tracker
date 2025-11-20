class WorkoutPlan < ApplicationRecord
  belongs_to :user

  has_many :plan_exercises, dependent: :destroy
  has_many :exercises, through: :plan_exercises

  validates :name, presence: true
end

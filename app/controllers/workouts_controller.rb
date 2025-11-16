class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, only: [:show, :destroy]

  def index
    @workouts = current_user.workouts.order(workout_date: :desc)
  end

  def show
    # @workout already loaded
  end

  # GET /workout_plans/:workout_plan_id/workouts/new
  def new
    @plan = current_user.workout_plans.find(params[:workout_plan_id])
    @workout = current_user.workouts.new(
      workout_plan: @plan,
      workout_date: Date.today
    )
  end

  # POST /workout_plans/:workout_plan_id/workouts
  def create
    plan = current_user.workout_plans.find(params[:workout_plan_id])

    @workout = current_user.workouts.create!(
      workout_plan: plan,
      workout_date: Date.today
    )

    plan.plan_exercises.order(:position).each do |pe|
      @workout.workout_exercises.create!(
        exercise: pe.exercise,
        position: pe.position
      )
    end

    redirect_to @workout, notice: "Workout started."
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path, notice: "Workout deleted."
  end

  private

  def set_workout
    @workout = current_user.workouts.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:workout_date, :workout_plan_id)
  end
end
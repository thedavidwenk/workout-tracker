class WorkoutPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout_plan, only: [ :show, :destroy ]
  def index
    @workout_plans = current_user.workout_plans.order(created_at: :desc)
  end

  def show
    # already set_workout_plan
  end

  def new
    @workout_plan = current_user.workout_plans.new
  end

  def create
  end

  def edit
  end

  def destroy
    @workout_plan.destroy
    redirect_to workout_plans_path, notice: "Workout Plan deleted."
  end

  private

  def set_workout_plan
    @workout_plan = current_user.workout_plans.find(params[:id])
  end

  def workout_plan_params
    params.require(:workout_plan).permit(:workout_date, :workout_plan_id)
  end
end

class WorkoutPlansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout_plan, only: [ :destroy, :edit, :update ]
  before_action :set_exercises, only: [ :new, :create, :edit, :update ]
  def index
    @workout_plans = current_user.workout_plans.order(created_at: :desc)
  end

  # def show
  #   # already set_workout_plan
  # end

  def new
    @workout_plan = current_user.workout_plans.new
  end

  def create
    @workout_plan = current_user.workout_plans.new(workout_plan_params)

    # pull the IDs directly from params, not from workout_plan_params
    selected_ids = Array(params[:workout_plan][:exercise_ids]).reject(&:blank?)

    if @workout_plan.save
      selected_ids.each_with_index do |exercise_id, idx|
        @workout_plan.plan_exercises.create!(
          exercise_id: exercise_id,
          position: idx + 1
        )
      end

      redirect_to workout_plans_path, notice: "Workout plan #{@workout_plan.name} created."
    else
      @exercises = Exercise.order(:name)  # needed when re-rendering :new
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # already set_workout_plan
    # already set_exercises
  end

  def update
    selected_ids = Array(params[:workout_plan][:exercise_ids]).reject(&:blank?)

    # 1. Update only name/comment (no validation conflicts)
    if @workout_plan.update(workout_plan_params)

      # 2. Now safely replace exercises
      @workout_plan.plan_exercises.destroy_all

      selected_ids.each_with_index do |exercise_id, idx|
        @workout_plan.plan_exercises.create!(
          exercise_id: exercise_id,
          position: idx + 1
        )
      end

      redirect_to workout_plans_path, notice: "Workout Plan updated."

    else
      @exercises = Exercise.order(:name)  # needed when re-rendering :edit
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout_plan.destroy
    redirect_to workout_plans_path, notice: "Workout Plan deleted."
  end

  private

  def set_workout_plan
    @workout_plan = current_user.workout_plans.find(params[:id])
  end
  
  def set_exercises
    @exercises = Exercise.order(:name)
  end

  def workout_plan_params
    params.require(:workout_plan)
          .permit(:name, :comment)
  end
end

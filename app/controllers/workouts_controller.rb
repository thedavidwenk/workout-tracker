class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, only: [:show, :destroy, :update]

  def index
    @workouts = current_user.workouts
                            .includes(workout_exercises: [:exercise, :workout_sets])
                            .order(created_at: :desc)
  end

  def show
    # @workout already loaded
  end

  def new
    plan = current_user.workout_plans.find(params[:workout_plan_id])

    # 1) Create the workout for this user + plan + today
    @workout = current_user.workouts.new(
      workout_plan: plan,
      workout_date: Date.today
    )
    
    # 2) For each exercise in the plan…
    plan.plan_exercises.order(:position).each do |pe|
      # …create a WorkoutExercise row for this workout
      we = @workout.workout_exercises.new(
        exercise: pe.exercise,
        position: pe.position
      )

      # 3) For this workout_exercise, create 3 empty sets
      3.times do |i|
          we.workout_sets.build(set_number: i + 1)
      end
    end
  end

  # POST /workout_plans/:workout_plan_id/workouts
  def create
    plan = current_user.workout_plans.find(params[:workout_plan_id])

    @workout = current_user.workouts.new(
      workout_plan: plan,
      workout_date: Date.today
    )

    # Apply nested attributes from the form (sets etc.)
    @workout.assign_attributes(workout_params)

    if @workout.save
      redirect_to @workout, notice: "Workout finished! Great job."
    else
      flash.now[:alert] = "Could not finish workout."
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout updated!"
    else
      flash.now[:alert] = "Could not save your changes."
      render :show, status: :unprocessable_entity
    end
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
    params.require(:workout).permit(
      workout_exercises_attributes: [
        :id, :exercise_id, :position,
        workout_sets_attributes: [ :id, :set_number, :reps, :weight_kg ]
      ]
    )
  end
end
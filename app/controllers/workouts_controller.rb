class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, only: [:show, :destroy]

  def index
    @workouts = current_user.workouts.order(workout_date: :desc)
  end

  def show
     @workout # is alredy loaded as set workout 
  end

  def create
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path, notice: "Workout deleted."
  end

  private

  def set_workout
  @workout = current_user.workouts.find(params[:id])
  end
end

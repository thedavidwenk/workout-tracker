Rails.application.routes.draw do
  devise_for :users

  # Workout Plans Tab
  resources :workout_plans do
    resources :workouts, only: [ :create ]
  end

  # My Workout Tab - List of all Workouts.
  resources :workouts, only: [ :index, :show, :update, :destroy ]

  root "workout_plans#index"
end

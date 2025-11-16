Rails.application.routes.draw do
  devise_for :users

  # Workout Plans Tab
  resources :workout_plans do
    resources :workouts, only: [:new, :create]
  end

  # My Workout Tab - List of all Workouts. No create actions needed
  resources :workouts, only: [:index, :show]

  root "workout_plans#index"
end

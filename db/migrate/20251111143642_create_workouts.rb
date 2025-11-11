class CreateWorkouts < ActiveRecord::Migration[8.0]
  def change
    create_table :workouts do |t|
      t.date :workout_date
      t.references :user, null: false, foreign_key: true
      t.references :workout_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end

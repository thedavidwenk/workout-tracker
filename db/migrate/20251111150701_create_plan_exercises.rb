class CreatePlanExercises < ActiveRecord::Migration[8.0]
  def change
    create_table :plan_exercises do |t|
      t.integer :position
      t.references :exercise, null: false, foreign_key: true
      t.references :workout_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end

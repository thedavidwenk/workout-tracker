class CreateWorkoutSets < ActiveRecord::Migration[8.0]
  def change
    create_table :workout_sets do |t|
      t.integer :set_number
      t.integer :reps
      t.float :weight_kg
      t.string :note
      t.references :workout_exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end

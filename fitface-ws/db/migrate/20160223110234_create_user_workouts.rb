class CreateUserWorkouts < ActiveRecord::Migration
  def change
    create_table :user_workouts do |t|
      t.belongs_to :user
      t.belongs_to :workout
      t.timestamps
    end
  end
end

class UserWorkout < ActiveRecord::Base
  attr_accessible :user_id, :workout_id

  belongs_to :user
  belongs_to :workout
end

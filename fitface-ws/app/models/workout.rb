class Workout < ActiveRecord::Base
  attr_accessible :name, :is_active

  has_many :user_workouts
  has_many :users, through: :user_workouts
end

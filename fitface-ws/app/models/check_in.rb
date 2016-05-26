class CheckIn < ActiveRecord::Base
  attr_accessible :user_id, :gym_id

  belongs_to :user
  belongs_to :gym
end

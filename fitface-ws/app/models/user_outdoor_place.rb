class UserOutdoorPlace < ActiveRecord::Base
  attr_accessible :user_id, :outdoor_place_id
  
  belongs_to :user
  belongs_to :outdoor_place
end

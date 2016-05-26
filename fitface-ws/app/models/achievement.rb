class Achievement < ActiveRecord::Base
  attr_accessible :user_id, :achieve, :event
  
  belongs_to :user
end

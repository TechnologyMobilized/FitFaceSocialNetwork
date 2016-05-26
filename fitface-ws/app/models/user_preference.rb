class UserPreference < ActiveRecord::Base
  attr_accessible :user_id, :turn_on_day

  belongs_to :user
end

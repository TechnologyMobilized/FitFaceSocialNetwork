class UserSport < ActiveRecord::Base
  attr_accessible :user_id, :sport_id

  belongs_to :user
  belongs_to :sport
end

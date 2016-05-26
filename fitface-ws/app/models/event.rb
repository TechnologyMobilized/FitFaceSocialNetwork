class Event < ActiveRecord::Base
  attr_accessible :name, :address, :latitude, :longitude, :is_active

  has_many :user_events
  has_many :users, through: :user_events
end

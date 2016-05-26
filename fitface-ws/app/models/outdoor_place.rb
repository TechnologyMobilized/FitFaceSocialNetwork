class OutdoorPlace < ActiveRecord::Base
  attr_accessible :name, :address, :latitude, :longitude, :is_active

  has_many :user_outdoor_places
  has_many :users, through: :user_outdoor_places

  def date
    self.created_at.strftime("%m/%d/%y")
  end
  
end

class Gym < ActiveRecord::Base
  attr_accessible :name, :address, :latitude, :longitude, :contact_number, :is_active

  has_many :user_gyms
  has_many :users, through: :user_gyms

  has_many :check_ins
  
  def date
    self.created_at.strftime("%m/%d/%y")
  end
end

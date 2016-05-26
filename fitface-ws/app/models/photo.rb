class Photo < ActiveRecord::Base
  attr_accessible :image, :user_id, :is_profile

  belongs_to :user
end

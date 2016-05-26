class Motivate < ActiveRecord::Base
  attr_accessible :user_id, :url, :is_video

  belongs_to :user
end

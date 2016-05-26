class Block < ActiveRecord::Base
  attr_accessible :report_id, :is_report

  belongs_to :user
  belongs_to :report, class_name: "User"
end

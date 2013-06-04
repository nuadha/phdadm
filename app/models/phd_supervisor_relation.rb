class PhdSupervisorRelation < ActiveRecord::Base
  attr_accessible :phd_id, :supervisor_id, :user_id
  belongs_to :supervisor, :class_name => "User" 
  belongs_to :phd, :class_name => "User"
end

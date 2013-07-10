class PhdSupervisorRelation < ActiveRecord::Base
  attr_accessible :phd_id, :supervisor_id
  belongs_to :supervisor, :class_name => "User" 
  belongs_to :phd, :class_name => "User"
  
  # validates :phd_id, :supervisor_id, :presence => true
  validates :phd_id, :uniqueness => true
end

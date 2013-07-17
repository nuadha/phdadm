class SupervisorProgressDeclaration < ActiveRecord::Base
  attr_accessible :date, :following_student_plan, :phd_id, :scientific_progress, :supervisor_id
  belongs_to :supervisor, :class_name => "User" 
  belongs_to :phd, :class_name => "User"
end

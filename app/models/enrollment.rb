class Enrollment < ActiveRecord::Base
  attr_accessible :course_id, :user_id, :enrollment_date, :completion_date
  belongs_to :course
  belongs_to :user
end

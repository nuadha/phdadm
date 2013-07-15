class Course < ActiveRecord::Base
  attr_accessible :ects, :link, :name, :time
  has_many :enrollments, :dependent => :destroy
  has_many :users, through: :enrollments
end

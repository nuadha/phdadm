class Article < ActiveRecord::Base
  attr_accessible :link, :title
  has_many :authors, :dependent => :destroy
  has_many :users, through: :authors
  
  validates :link, :title, :presence => :true
  validates :title, :uniqueness => true
end

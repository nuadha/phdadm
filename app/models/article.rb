class Article < ActiveRecord::Base
  attr_accessible :link, :title
  has_many :authors
  has_many :users, through: :authors
end

class Role < ActiveRecord::Base

  attr_accessible :name, :access_level
  
  has_many :user_roles, :dependent => :destroy
  has_many :users, :through => :user_roles
  
  validates :name, 
  	:presence => true,
  	:uniqueness => true

  validates :access_level, :presence => true

end

class Role < ActiveRecord::Base
  
  attr_accessible :name, :access_level
  
  has_many :user_roles, :dependent => :destroy
  has_many :users, :through => :user_roles
  
end

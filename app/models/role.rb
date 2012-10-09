class Role < ActiveRecord::Base
  
	before_validation :default_access

  attr_accessible :name, :access_level
  
  has_many :user_roles, :dependent => :destroy
  has_many :users, :through => :user_roles
  
  validates :name, 
  	:presence => true,
  	:uniqueness => true

  validates :access_level, :presence => true

private

  def default_access
  	self.access_level ||= 0
  end

end

class UserRole < ActiveRecord::Base
  
  attr_accessible :role_id, :user_id

  belongs_to :role
  belongs_to :user
  
  validates :role_id, :presence => true
  validates :user_id, :presence => true

end

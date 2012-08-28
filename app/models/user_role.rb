class UserRole < ActiveRecord::Base
  
  attr_accessible :role_id, :user_id
  belongs_to :role
  belongs_to :user
  
end
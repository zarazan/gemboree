module Gemboree
  module ActsAsActor
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    def acts_as_actor(options = {})
      has_many :user_roles, :dependent => :destroy
      has_many :roles, :through => :user_roles
      
      include Gemboree::ActsAsActor::InstanceMethods
    end  
    
    module InstanceMethods
    
      def access_level
        roles.first.nil? ? 0 : roles.order('level desc').first.level
      end
    
      def has_role?(role_name)
        roles.find_by_name(role_name).any?
      end
      
    end
  end
end

module Gemboree
  module ActsAsActor
      
    def acts_as_actor(options = {})
      has_many :user_roles, :foreign_key => "user_id", :dependent => :destroy
      has_many :roles, :through => :user_roles
      include InstanceMethods
    end

    module InstanceMethods

      def access_level
        roles.first.nil? ? 0 : roles.order('access_level desc').first.access_level
      end

      def has_access?(level)
        access_level >= level
      end

      def has_role?(name)
        roles.find_by_name(name)
      end
      
      def add_role(name)
        return false if has_role?(name)
        role = Role.find_by_name(name)
        role ? roles << role : false
      end
      
      def remove_role(name)
        role = has_role?(name)
        role ? UserRole.where(user_id: id, role_id: role.id).first.delete : false
      end
      
    end
    
  end
end
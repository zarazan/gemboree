module Gemboree
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def setup_home_page
        remove_file "public/index.html"
        remove_file "app/assets/images/rails.png"
        remove_file "app/views/layouts/application.html.erb"
        copy_file "home_controller.rb", "app/controllers/home_controller.rb"
        copy_file "index.html.erb", "app/views/home/index.html.erb"
        copy_file "application.html.erb", "app/views/layouts/application.html.erb"
        route "root :to => 'home#index'"
      end

      def setup_asssets
        insert_into_file "app/assets/javascripts/application.js", :after => "jquery_ujs\n" do
           "//= require gemboree\n"
        end
        insert_into_file "app/assets/stylesheets/application.css", :after => "require_self\n" do
          " *= require gemboree\n"
        end
      end

      def setup_devise
        generate "devise:install"
        generate "devise", "User"
      end

      def setup_cancan
        copy_file "ability.rb", "app/models/ability.rb"
      end

      def setup_roles
        generate "gemboree:migration"
        insert_into_file "app/models/user.rb", :after => "ActiveRecord::Base\n" do
%{  acts_as_actor
  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles
}
        end
      end
      
    end
  end
end

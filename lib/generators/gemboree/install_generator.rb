module Gemboree
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def setup_home_page
        remove_file "public/index.html"
        remove_file "app/assets/images/rails.png"
        remove_file "app/views/layouts/application.html.erb"
        empty_directory "app/views/home/"
        copy_file "home_controller.rb", "app/controllers/home_controller.rb"
        copy_file "index.slim", "app/views/home/index.slim"
        copy_file "application.slim", "app/views/layouts/application.slim"
        route "root :to => 'home#index'"
      end

      def use_thin
        gem "thin"
      end

      def setup_asssets
        insert_into_file "app/assets/javascripts/application.js", "\n//= require gemboree", :after => "//= require jquery_ujs"
        insert_into_file "app/assets/stylesheets/application.css", "\n*= require gemboree", :after => "*= require_self"
      end

      def setup_devise
        generate "devise:install"
        generate "devise", "User"
      end

      def setup_cancan
        copy_file "ability.rb", "app/models/ability.rb"
      end

      def setup_roles
        generate "model", "Roles name:string level:integer"
        generate "model", "UserRoles user_id:integer role_id:integer"
      end
      
    end
  end
end
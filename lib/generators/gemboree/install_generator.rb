module Gemboree
  module Generators
    class InstallGenerator < Rails::Generators::Base
    
      def setup_home_page
        create_file "app/controllers/home_controller.rb", "class HomeController < ApplicationController\n  def index\n  end\nend"
        empty_directory "app/views/home/"
        create_file "app/views/home/index.html.erb", "<h1>Gemboree Initiated</h1>"
        remove_file 'public/index.html'
        remove_file 'app/assets/images/rails.png'
        route "root :to => 'home#index'"
      end
      
      def setup_asssets
        insert_into_file "app/assets/javascripts/application.js", "\n //= require gemboree", :after => "//= require jquery_ujs"
        insert_into_file "app/assets/stylesheets/application.css", "\n  *= require gemboree", :after => " *= require_self"
      end
    
      def setup_cancan
        generate "cancan:ability"
        insert_into_file "app/models/ability.rb", "\n  can :manage, :all", :after => "def initialize(user)"
        insert_into_file "app/controllers/application_controller.rb", "\n  def current_user\n    nil\n  end", :after => "protect_from_forgery"
      end
      
      def copy_error_view
        copy_file "../../../app/views/layouts/_errors.html.erb", "app/views/layouts/_errors.html.erb"
      end
        
      def use_thin
        gem "thin"
      end
      
    end
  end
end
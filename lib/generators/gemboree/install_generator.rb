module Gemboree
  module Generators
    class InstallGenerator < Rails::Generators::Base
    
      def setup_home_page
        create_file "app/controllers/home_controller.rb" do
          "class HomeController < ApplicationController
            def index
            end
          end"
        end
        empty_directory "app/views/home/"
        create_file "app/views/home/index.html.erb", "<h1>Gemboree Initiated</h1>"
        remove_file 'app/public/index.html'
        route "root :to => 'home#index'"
      end
      
      def setup_asssets
        insert_into_file "app/assets/javascripts/application.js", "//= require gemboree", :after => "//= require jquery_ujs"
        insert_into_file "app/assets/stylesheets/application.css", " *= require gemboree", :after => " *= require_self"
      end
    
    end
  end
end
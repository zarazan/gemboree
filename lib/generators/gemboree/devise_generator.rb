module Gemboree
  module Generators
    class DeviseGenerator < Rails::Generators::Base

      source_root File.expand_path("../../../templates/devise/", __FILE__)

      def copy_views
        copy_file "registrations/new.html.erb", "app/views/devise/registrations/new.html.erb"
      end

    end
  end
end

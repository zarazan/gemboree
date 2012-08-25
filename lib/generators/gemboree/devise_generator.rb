module Gemboree
module Generators
class DeviseGenerator < Rails::Generators::Base

  source_root File.expand_path("../../templates/devise/registrations", __FILE__)

  def copy_views
    copy_file "new.html.erb", "app/views/devise/registrations/new.html.rb"
  end

end
end
end
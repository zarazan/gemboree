module Gemboree
  class Engine < Rails::Engine
    require 'cancan'
    require 'will_paginate'
    config.app_generators do |g|
      g.templates.unshift File::expand_path('../templates', __FILE__)
    end 
  end
end
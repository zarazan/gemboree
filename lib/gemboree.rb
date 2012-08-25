module Gemboree
  class Engine < Rails::Engine
    
    require 'devise'
    require 'cancan'
    require 'will_paginate'
    
    require 'gemboree/acts_as_actor'
    
    config.app_generators do |g|
      g.templates.unshift File::expand_path('../templates', __FILE__)
    end
    
  end
end
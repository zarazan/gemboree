require 'devise'
require 'cancan'
require 'will_paginate'
require 'gemboree/version'
require 'gemboree/acts_as_actor'
require 'paperclip'

module Gemboree
  
  class Engine < Rails::Engine
    
    initializer 'acts_as_actor.ar_extensions' do |app|
      ActiveRecord::Base.extend Gemboree::ActsAsActor
    end
    
    config.app_generators do |g|
      g.templates.unshift File::expand_path('../templates', __FILE__)
    end
    
  end
  
end

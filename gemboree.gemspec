$:.push File.expand_path("../lib", __FILE__)

require "gemboree/version"

Gem::Specification.new do |s|
  s.name        = "gemboree"
  s.version     = Gemboree::VERSION
  s.authors     = ["Kyle Zarazan", "John Resman"]
  s.email       = "hello@brocktoncg.com"
  s.homepage    = "http://brocktoncg.com"
  s.summary     = "Gem based jamboree"
  s.description = "Rails based boilerplate for using boostrap, cancan, and will_paginate together."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "devise", "~> 2.1.2"
  s.add_dependency "cancan", "~> 1.6.8"
  s.add_dependency "will_paginate", "~> 3.0.3"
  s.add_dependency "simple_form", "~> 2.0.2"
end
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_fancies/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_fancies"
  s.version     = RailsFancies::VERSION
  s.authors     = ["Chris Drane"]
  s.email       = ["obromios@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsFancies."
  s.description = "TODO: Description of RailsFancies."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "better_errors"
  s.add_development_dependency 'binding_of_caller'
end

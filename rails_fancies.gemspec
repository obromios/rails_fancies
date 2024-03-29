$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_fancies/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rails_fancies'
  s.version     = RailsFancies::VERSION
  s.authors     = ['Obromios']
  s.email       = ['obromios@gmail.com']
  s.homepage    = 'https://github.com/obromios/rails_fancies'
  # rubocop:disable LineLength
  s.summary     = 'Rails Fancies is an open source project to develop some fanciful Ruby on Rails helpers.'
  s.description = 'Most rails helpers tend to be tightly focused on placing a single element on a page, like a link or an image tag.  Rails Fancies is for helpers that are more complex and can form the basis of complete a web page. The inaugural helpers are a FAQ helper and a weekly calendar helper.'
  s.license     = 'MIT'
  s.metadata    = {
    'source_code_uri' => 'https://github.com/obromios/rails_fancies',
    'changelog_uri' => 'https://github.com/obromios/rails_fancies/blob/master/CHANGELOG.md'
  }
  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  # rubocop:enable LineLength
  s.add_development_dependency 'better_errors'
  s.add_development_dependency 'rails-html-sanitizer'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.13'
  s.add_development_dependency 'binding_of_caller'
  s.add_development_dependency 'ffi'
  s.add_development_dependency 'loofah'
  s.add_development_dependency 'meta_request'
  s.add_development_dependency 'sassc-rails'
  s.add_development_dependency 'rack'
  s.add_development_dependency 'nokogiri'
  s.add_development_dependency 'rake'
  s.add_runtime_dependency 'rails'
end

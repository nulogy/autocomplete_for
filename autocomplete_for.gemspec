$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'autocomplete_for/version.rb'

# encoding: utf-8
Gem::Specification.new do |s|
  s.name         = 'autocomplete_for'
  s.version     = AutocompleteFor::VERSION
  s.authors      = ['Sean Kirby']
  s.email        = 'skirby@gmail.com'
  s.summary      = 'Autocomplete for models'
  s.description  = 'Model-side logic for autocompleting belongs_to associations'

  s.files                     = Dir.glob('lib/**/*') + %w(README.rdoc MIT-LICENSE)
  s.platform                  = Gem::Platform::RUBY
  s.require_path              = 'lib'
  s.rubyforge_project         = '[none]'
  s.required_rubygems_version = '>= 2.7'

  s.add_runtime_dependency 'activerecord', '> 5.0', '< 6.0'

  s.add_development_dependency 'rails', '~> 5.0', '< 6.0'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rspec-rails', '~> 3.8'
  s.add_development_dependency 'sqlite3', '~> 1.3'

  s.licenses = ['MIT', 'GPL-3.0']
end

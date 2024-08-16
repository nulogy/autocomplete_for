# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "autocomplete_for/version"

Gem::Specification.new do |s|
  s.name = "autocomplete_for"
  s.version = AutocompleteFor::VERSION
  s.license = "MIT"
  s.summary = "Autocomplete for models"
  s.description = "Model-side logic for autocompleting belongs_to associations"
  s.files = Dir.glob("lib/**/*") + %w[README.markdown MIT-LICENSE]
  s.authors = ["Sean Kirby", "Alistair McKinnell"]
  s.email = "skirby@gmail.com"
  s.homepage = "https://github.com/nulogy/autocomplete_for"

  s.metadata = {
    "homepage_uri" => "https://github.com/nulogy/autocomplete_for",
    "changelog_uri" => "https://github.com/nulogy/autocomplete_for/blob/master/CHANGELOG.md",
    "bug_tracker_uri" => "https://github.com/nulogy/autocomplete_for/issues",
    "rubygems_mfa_required" => "true"
  }

  s.platform = Gem::Platform::RUBY
  s.require_path = "lib"
  s.required_ruby_version = ">= 3.1"

  s.add_dependency "activerecord", ">= 7.0", "< 7.2"

  s.add_development_dependency "appraisal", "~> 2.5"
  s.add_development_dependency "rails", ">= 7.0", "< 7.2"
  s.add_development_dependency "rake", "~> 13.2"
  s.add_development_dependency "rspec-rails", "~> 6.1"
  s.add_development_dependency "rubocop", "~> 1.65"
  s.add_development_dependency "sqlite3", "~> 1.4"
end

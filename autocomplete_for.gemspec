# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "autocomplete_for/version"

Gem::Specification.new do |s|
  s.name = "autocomplete_for"
  s.version = AutocompleteFor::VERSION
  s.licenses = ["MIT", "GPL-3.0"]
  s.summary = "Autocomplete for models"
  s.description = "Model-side logic for autocompleting belongs_to associations"
  s.files = Dir.glob("lib/**/*") + %w[README.markdown MIT-LICENSE]
  s.authors = ["Sean Kirby", "Alistair McKinnell"]
  s.email = "skirby@gmail.com"
  s.homepage = "https://github.com/nulogy/autocomplete_for"

  s.metadata = {
    "homepage_uri" => "https://github.com/nulogy/autocomplete_for",
    "changelog_uri" => "https://github.com/nulogy/autocomplete_for/blob/master/CHANGELOG.md",
    "source_code_uri" => "https://github.com/nulogy/autocomplete_for",
    "bug_tracker_uri" => "https://github.com/nulogy/autocomplete_for/issues",
    "rubygems_mfa_required" => "true"
  }

  s.platform = Gem::Platform::RUBY
  s.require_path = "lib"
  s.required_ruby_version = ">= 3.0"

  s.add_runtime_dependency "activerecord", ">= 6.1", "< 7.1"

  s.add_development_dependency "appraisal", "~> 2.4"
  s.add_development_dependency "rails", ">= 6.1", "< 7.1"
  s.add_development_dependency "rake", "~> 13.0"
  s.add_development_dependency "rspec-rails", "~> 6.0"
  s.add_development_dependency "rubocop", "~> 1.48"
  s.add_development_dependency "sqlite3", "~> 1.6"
end

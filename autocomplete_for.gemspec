# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "autocomplete_for"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sean Kirby"]
  s.date = "2011-10-26"
  s.description = "Model-side logic for autocompleting belongs_to associations"
  s.email = "sskirby@gmail.com"
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "MIT-LICENSE",
    "README.markdown",
    "Rakefile",
    "autocomplete_for.gemspec",
    "lib/autocomplete_for.rb",
    "lib/autocomplete_for/autocomplete_for.rb",
    "rails/init.rb",
    "test/autocomplete_for_test.rb",
    "test/database.yml",
    "test/schema.rb",
    "test/test_helper.rb"
  ]
  s.homepage = "http://github.com/nulogy/autocomplete_for"
  s.require_paths = ["lib"]
  s.rubyforge_project = "autocomplete_for"
  s.rubygems_version = "1.8.10"
  s.summary = "Model-side logic for autocompleting belongs_to associations"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<pg>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<activerecord>, ["~> 5.0.1"])
    else
      s.add_dependency(%q<pg>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<activerecord>, ["~> 5.0.1"])
    end
  else
    s.add_dependency(%q<pg>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<activerecord>, ["~> 5.0.1"])
  end

  s.add_development_dependency("rspec", "~> 3.8")
end


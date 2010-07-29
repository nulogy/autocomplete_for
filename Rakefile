require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "autocomplete_for"
    s.summary = "Model-side logic for autocompleting belongs_to associations"
    s.description = "Model-side logic for autocompleting belongs_to associations"
    s.email = "sskirby@gmail.com"
    s.homepage = "http://github.com/sskirby/autocomplete_for"
    s.rubyforge_project = 'autocomplete_for'
    s.authors = ["Sean Kirby"]
    s.add_dependency('activerecord', '>= 2.3.5')
    s.add_development_dependency('pg')
  end

rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the autocomplete_for plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the autocomplete_for plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'AutocompleteFor'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

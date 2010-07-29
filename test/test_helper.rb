require 'rubygems'
require 'active_support'
require 'active_support/test_case'

require 'test/unit' 
require 'active_record'

def load_schema 
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))  
  ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")  
  db_adapter = ENV['DB'] || 'postgresql'
  
  if config[db_adapter].nil? 
    raise "DB Adapter #{db_adapter} has no entries in database.yml."  
  end  
  
  ActiveRecord::Base.establish_connection(config[db_adapter])  
  load(File.dirname(__FILE__) + "/schema.rb")  
  require File.dirname(__FILE__) + '/../rails/init' 
end 

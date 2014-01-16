ENV["RAILS_ENV"] ||= 'test'
require File.expand_path('../../spec/dummy/config/environment', __FILE__)


require 'rspec/rails'
require 'rspec/autorun'


$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))



require 'restive_record'
require 'database_cleaner'
require 'timecop'
require 'pry'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }



Rails.backtrace_cleaner.remove_silencers!

# Run any available migration
ActiveRecord::Migrator.migrate File.expand_path("../dummy/db/migrate/", __FILE__)

# Load support files


RSpec.configure do |config|

  # config.filter_run_excluding skip: true 
  # config.run_all_when_everything_filtered = true
  # config.filter_run :focus => true
  config.mock_with :rspec
  config.order = "random"
  # Use color in STDOUT
  config.color_enabled = true
  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end




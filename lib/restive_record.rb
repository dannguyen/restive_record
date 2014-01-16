require 'restive_record/config'
require 'restive_record/has_restive_record'
# require 'restive_record/cleaner'
require 'restive_record/version_number'

module RestiveRecord
  # extend RestiveRecord::Cleaner

  def self.enabled=(value)
    RestiveRecord.config.enabled = value
  end

  def self.enabled?
    !!RestiveRecord.config.enabled
  end

  def self.timestamp_field=(field_name)
    RestiveRecord.config.timestamp_field = field_name
  end

  def self.timestamp_field
    RestiveRecord.config.timestamp_field
  end

  def self.active_record_protected_attributes?
    @active_record_protected_attributes ||= ::ActiveRecord::VERSION::MAJOR < 4 || !!defined?(ProtectedAttributes)
  end

  private

  def self.config
    @@config ||= RestiveRecord::Config.instance
  end

  def self.configure
    yield config
  end


end

require 'restive_record/snapshot'



# # Ensure `ProtectedAttributes` gem gets required if it is available before the `Version` class gets loaded in
# unless RestiveRecord.active_record_protected_attributes?
#   RestiveRecord.send(:remove_instance_variable, :@active_record_protected_attributes)
#   begin
#     require 'protected_attributes'
#   rescue LoadError; end # will rescue if `ProtectedAttributes` gem is not available
# end


# require 'restive_record/frameworks/rails'
# require 'restive_record/frameworks/sinatra'
# require 'restive_record/frameworks/rspec' if defined? RSpec


# RestiveRecord.on_load(:active_record) do
#   include RestiveRecord::Model
# end

# if defined?(ActionController)
#   ActiveSupport.on_load(:action_controller) do
#     include RestiveRecord::Rails::Controller
#   end
# end

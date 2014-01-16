require 'singleton'

module RestiveRecord
  class Config
    include Singleton
    attr_accessor :enabled, :timestamp_field, :serializer, :snapshot_limit

    def initialize
      @enabled            = true
      @timestamp_field    = :created_at
      @serializer         = "TODO"
    end
  end
end

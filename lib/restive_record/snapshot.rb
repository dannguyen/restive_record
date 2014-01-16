require File.expand_path('../snapshot_concern', __FILE__)

module RestiveRecord
  class Snapshot < ::ActiveRecord::Base
    include RestiveRecord::SnapshotConcern
  end
end

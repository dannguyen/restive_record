require 'active_support/concern'

module RestiveRecord
  module SnapshotConcern
    extend ::ActiveSupport::Concern

    included do
      belongs_to :item, :polymorphic => true
    end

    module ClassMethods


    end

  end
end
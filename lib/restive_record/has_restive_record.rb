module RestiveRecord
  module Model

    def self.included(base)
      base.send :extend, ClassMethods
    end


    module ClassMethods
      
      def has_restive_record(options={})
        send :include, InstanceMethods

        # the archived record this thing came from
        attr_accessor self.snapshot_class_name

        class_attribute :snapshot_class_name
        self.snapshot_class_name = options[:class_name] || "RestiveRecord::#{self.name.demodulize}Snapshot"

        class_attribute :restive_record_options
        self.restive_record_options = options.dup


        restive_record_options[:meta] ||= {}

        class_attribute :restive_record_enabled_for_model
        self.restive_record_enabled_for_model = true

        class_attribute :snapshots_association_name
        self.snapshots_association_name = options[:snapshots] || :snapshots

        attr_accessor :restive_record_event

        if ::ActiveRecord::VERSION::MAJOR >= 4
          has_many self.snapshots_association_name,
            lambda{ order("#{RestiveRecord.timestamp_field} ASC")},
            class_name:  self.snapshot_class_name,
            as:          :item
        else
          has_many self.snapshots_association_name,
            class_name: self.snapshot_class_name,
            as:         :item,
            order:      "#{RestiveRecord.timestamp_field} ASC"
        end

        after_update :record_update 
      end

      def restive_record_on
        self.restive_record_enabled_for_model = true
      end

      def restive_record_off
        self.restive_record_enabled_for_model = false
      end


      

    end
    ############################ end class_methods

  end
end
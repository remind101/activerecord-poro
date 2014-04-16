require 'active_support/dependencies'
require 'active_record'
require 'active_record/poro/version'

module ActiveRecord
  module Poro
    extend ActiveSupport::Concern
    include ActiveRecord::Reflection
    include ActiveRecord::Associations

    module ClassMethods
      def pluralize_table_names
        true
      end

      def generated_feature_methods
        @generated_feature_methods ||= begin
          mod = const_set(:GeneratedFeatureMethods, Module.new)
          include mod
          mod
        end
      end

      def add_autosave_association_callbacks(reflection)
        # NOOP
      end

      def connection
        ActiveRecord::Base.connection
      end
    end
  end
end

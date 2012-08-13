require 'cassandra_cql_rails/instrumentation'

module CassandraCQLRails
  module Instrumentation

    module ControllerRuntime
      extend ActiveSupport::Concern

    protected

      attr_internal :cassandra_runtime

      def cleanup_view_runtime
        cassandra_rt_before_render = LogSubscriber.reset_runtime
        runtime = super
        cassandra_rt_after_render = LogSubscriber.reset_runtime
        self.cassandra_runtime = cassandra_rt_before_render +
                                  cassandra_rt_after_render
        runtime - cassandra_rt_after_render
      end

      def append_info_to_payload(payload)
        super
        payload[:cassandra_runtime] = cassandra_runtime
      end

      module ClassMethods
        def log_process_action(payload)
          messages          = super
          cassandra_runtime = payload[:cassandra_runtime]
          if cassandra_runtime
            messages << ("Cassandra: %.1fms" % cassandra_runtime.to_f)
          end
          messages
        end
      end

    end

  end
end

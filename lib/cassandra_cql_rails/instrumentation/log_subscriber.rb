require 'cassandra_cql_rails/instrumentation'

module CassandraCQLRails
  module Instrumentation

    class LogSubscriber < ActiveSupport::LogSubscriber

      def self.runtime=(value)
        Thread.current["cassandra_cassandra_runtime"] = value
      end

      def self.runtime
        Thread.current["cassandra_cassandra_runtime"] ||= 0
      end

      def self.reset_runtime
        rt            = runtime
        self.runtime  = 0
        rt
      end

      def cassandra(event)
        self.class.runtime += event.duration
      end

      def query(event)
        return unless logger.debug?
        cql   = event.payload[:cql].first
        name  = "CASSANDRA CQL QUERY"
        debug("  #{color(name, YELLOW, true)} { #{cql} } ")
      end

      def logger
        Rails.logger
      end

    end

  end
end

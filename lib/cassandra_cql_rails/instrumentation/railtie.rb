require 'cassandra_cql_rails/instrumentation'

module CassandraCQLRails
  module Instrumentation

    class Railtie < Rails::Railtie
      initializer "cassandra.rails.instrumentation" do |app|
        instrument( CassandraCQL::Database,
                    [ :execute ],
                    "cassandra" )

        instrument( CassandraCQL::Database,
                    [ :execute_cql_query ],
                    "query" )

        ActiveSupport.on_load(:action_controller) do
          include ControllerRuntime
        end

        LogSubscriber.attach_to :cassandra
      end

      def instrument(clazz, methods, name)
        clazz.module_eval do
          methods.each do |m|
            class_eval %{def #{m}_with_instrumentation(*args, &block)
              ActiveSupport::Notifications.instrumenter.instrument(
              "#{name}.cassandra",
              :name => "#{m}",
              :cql  => args) do
                #{m}_without_instrumentation(*args, &block)
              end
            end
            }

            alias_method_chain m, :instrumentation
          end
        end
      end
    end

  end
end

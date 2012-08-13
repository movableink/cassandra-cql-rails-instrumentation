module CassandraCQLRails
  module Instrumentation
    path = 'cassandra_cql_rails/instrumentation'
    autoload :Version,            File.join(path, 'version')
    autoload :Railtie,            File.join(path, 'railtie')
    autoload :LogSubscriber,      File.join(path, 'log_subscriber')
    autoload :ControllerRuntime,  File.join(path, 'controller_runtime')
  end
end

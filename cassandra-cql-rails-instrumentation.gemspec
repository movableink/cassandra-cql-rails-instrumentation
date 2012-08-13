# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cassandra_cql_rails/instrumentation/version"

Gem::Specification.new do |s|
  s.name        = "cassandra-cql-rails-instrumentation"
  s.version     = CassandraCQLRails::Instrumentation::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Olivier Lauzon"]
  s.email       = ["olauzon@gmail.com"]
  s.homepage    = [ "https://github.com/olauzon/",
                    "cassandra-cql-rails-instrumentation"].join
  s.summary     = %q{Records duration of Cassandra CQL queries}
  s.description = [ "Records Cassandra CQL queries and adds queries and their",
                    "duration to the Rails logger." ].join(' ')
  s.files         = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
end

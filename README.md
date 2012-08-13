Cassandra CQL Rails 3 Instrumentation
=====================================

Records the duration of
[Cassandra CQL](https://github.com/kreynolds/cassandra-cql) requests in your
Ruby on Rails application in the request log.

See https://github.com/kreynolds/cassandra-cql for information on using the
`cassandra-cql` gem.


Example log output
------------------

```text
CASSANDRA CQL QUERY { SELECT * FROM my_column_family WHERE my_column = 'my_value' } 
Completed 200 OK in 27ms (Views: 0.2ms | ActiveRecord: 3.5ms | Cassandra: 6.3ms)
```

Installation
------------

Add the gem to your Gemfile and restart your application:

```ruby
gem 'cassandra-cql-rails-instrumentation',
    :git => 'git://github.com/olauzon/cassandra-cql-rails-instrumentation.git'
```

Used with Rails 3.2.7, and should work with all 3.x versions.


Credits
-------

This gem is based entirely on the `mongo-rails-instrumentation` gem located at
https://github.com/freerange/mongo-rails-instrumentation.


License
-------

All code is released under the MIT License.

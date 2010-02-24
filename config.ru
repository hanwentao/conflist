#!/opt/ruby-enterprise-1.8.7-2010.01/lib/ruby/gems/1.8/gems/rack-1.1.0/bin/rackup
#
#!/usr/bin/env rackup
#
# xrn:
#  config.ru is for rackup, as for apache+passenger, it's for mod_passenger, 
#  it initializes the app (by requiring app.rb) and then start the process ramaze.
#
# config.ru for ramaze apps
# use thin >= 1.0.0
# thin start -R config.ru
#
# rackup is a useful tool for running Rack applications, which uses the
# Rack::Builder DSL to configure middleware and build up applications easily.
#
# rackup automatically figures out the environment it is run in, and runs your
# application as FastCGI, CGI, or standalone with Mongrel or WEBrick -- all from
# the same configuration.
#
# Do not set the adapter.handler in here, it will be ignored.
# You can choose the adapter like `ramaze start -s mongrel` or set it in the
# 'start.rb' and use `ruby start.rb` instead.

require 'app'

Ramaze.options.mode = :live

# ramaze stores session data in memory by default. This can lead to data loss
# when phison passenger is deployed which may fork a new process for a new request. 
# Using Sequel serialization to the file-system
Ramaze.options.cache.session = Ramaze::Cache::Sequel

Ramaze.start(:root => __DIR__, :started => true)
run Ramaze

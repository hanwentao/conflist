# xrn:
#  this is used to start a standalone server, actually has nothing to do with mod_passenger.
#
# Use this file directly like `ruby start.rb` if you don't want to use the
# `ramaze start` command.
# All application related things should go into `app.rb`, this file is simply
# for options related to running the application locally.
require 'app'

Ramaze.start(:adapter => :webrick, :port => 8000) if $0 == __FILE__

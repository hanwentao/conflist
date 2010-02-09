require 'sequel'

Sequel::Model.plugin(:schema)

DB = Sequel.sqlite('conference.db')

require 'model/conference'

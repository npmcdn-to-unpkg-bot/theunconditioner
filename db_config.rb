require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'theunconditioner'
}

ActiveRecord::Base.establish_connection(options)
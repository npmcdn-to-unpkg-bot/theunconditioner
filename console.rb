require'pry'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

require './db_config'
require './models/user'
require './models/topic'
require './models/card'
require './models/complete'

binding.pry
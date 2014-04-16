require 'bundler/setup'
Bundler.require :default, :test
require 'virtus'

RSpec.configure do |config|
  config.order = 'random'
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each {|f| require f}

ActiveRecord::Base.logger = Logger.new(STDOUT)

# Connect to an in-memory sqlite3 database
ActiveRecord::Base.establish_connection( :adapter  => 'sqlite3',
                                         :database => ':memory:' )

# Create the minimal database schema necessary to reproduce the bug
ActiveRecord::Schema.define do
  create_table "users" do |t|
  end

  create_table "messages" do |t|
    t.belongs_to :user
  end
end

class User < ActiveRecord::Base
  has_many :messages
end

class Message < ActiveRecord::Base
  belongs_to :user
end

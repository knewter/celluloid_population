require 'minitest/autorun'
require 'minitest/reporters'

require 'mocha'

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Set up minitest
MiniTest::Unit.runner = MiniTest::SuiteRunner.new
MiniTest::Unit.runner.reporters << MiniTest::Reporters::SpecReporter.new

# Load the app
require File.expand_path("../../lib/person.rb", __FILE__)

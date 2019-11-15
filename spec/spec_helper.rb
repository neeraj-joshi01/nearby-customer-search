require 'rspec'
require 'pry'

require File.dirname(__FILE__) + '/../app.rb'

RSpec.configure do |config|
  config.formatter = :documentation
end

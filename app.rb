Dir[File.dirname(__FILE__) + '/lib/**/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/app/**/*.rb'].each {|file| require file }
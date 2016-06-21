require 'bundler/setup'
Bundler.setup

require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

RSpec.configure do |config|
end

$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
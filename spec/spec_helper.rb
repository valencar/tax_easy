require 'bundler/setup'
Bundler.setup

require 'your_gem_name' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end

$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require "simplecov"
SimpleCov.start do
  add_filter ".bundle"
  add_filter "spec"
end

$:.unshift File.expand_path("../..", __FILE__)

require "webmock/rspec"
require "json"
require "magnum/addons/flowdock"

WebMock.disable_net_connect!

def fixture_path(filename=nil)
  path = File.expand_path("../fixtures", __FILE__)
  filename.nil? ? path : File.join(path, filename)
end

def fixture(file)
  File.read(File.join(fixture_path, file))
end

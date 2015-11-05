require "coveralls"
require "crumple"
require "rspec"
require "fakefs/spec_helpers"

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers, fakefs: true
end

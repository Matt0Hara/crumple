require "coveralls"
require "crumple"
require "capybara/rspec"
require "fakefs/spec_helpers"

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers, fakefs: true
end

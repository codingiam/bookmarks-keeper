# frozen_string_literal: true

$LOAD_PATH << File.expand_path("..", __dir__)

require "active_support"
require "active_support/core_ext"
require "byebug"
require "webmock/rspec"

ENV["REDIS_URL"] = "redis://localhost:6379/1"

Dir["spec/support/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  config.order = "random"
  config.include SpecHelper

  WebMock.disable_net_connect!(allow_localhost: true)

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end
end

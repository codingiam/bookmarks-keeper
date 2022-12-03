require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# ~ Bundler.require(:default, Rails.env)
Bundler.require(*Rails.groups)

module BookmarksKeeper
  class Application < Rails::Application
    def initialize!
      start = Time.current
      super
      time = (Time.current - start) * 1000
      warn "[BOOT] Rails booted in #{time}ms"
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.middleware.insert_before Rack::ETag, Rack::Deflater
    config.exceptions_app = routes
    config.active_job.queue_adapter = :sidekiq

    config.active_model.i18n_customize_full_message = true

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end

# frozen_string_literal: true

# rubocop:disable Bundler/OrderedGems

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.6"

gem "dotenv-rails", require: "dotenv/rails-now", group: [:development, :test]

Dir.glob(File.expand_path("vendor/gems/**/*.gemspec"))
  .map(&File.method(:dirname))
  .each { |path| gem File.basename(path), path: path }

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# gem "administrate", "0.8.1"
gem "attr_extras"
# gem "email_validator"
# gem "faraday"
gem "haml-rails"
gem "high_voltage"
# gem "inifile"
# gem "jwt"
gem "nokogiri", ">= 1.13.9"
# gem "omniauth-rails_csrf_protection"
# gem "paranoia", "~> 2.2"
# gem "pathspec"
# gem "record_tag_helper"
# Use SCSS for stylesheets
gem "sass-rails", ">= 6"
gem "sentry-raven"
gem "sidekiq"
gem "sinatra", "~> 2.2"
gem "uglifier", ">= 2.7.2"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# gem "bootstrap", "~> 4.5.0"

gem "simple_form"
gem "activemodel-form"

group :production do
  gem "rack-timeout"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", ">= 3.4"
  gem "pry-byebug"
  gem "pry-rails"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  gem "attractor"
  gem "attractor-ruby"

  gem "ruby-prof"

  gem "bundler-audit", require: false
  gem "foreman"

  gem "solargraph", "~> 0.44.0", require: false

  gem "rubocop", "~> 1.11.0", require: false
  gem "rubocop-rspec", "~> 1.41.0", require: false
  gem "rubocop-performance", "~> 1.10.1", require: false
  gem "rubocop-rails", "~> 2.5.2", require: false
  gem "standard", "~> 1.0.4", require: false
  gem "reek", "~> 6.0.6", require: false
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "factory_girl_rails"
  gem "launchy"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "shoulda-matchers"
  gem "webmock"
  gem "test-prof"
end

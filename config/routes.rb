# frozen_string_literal: true

require "sidekiq/web"

Sidekiq::Web.use Rack::Auth::Basic do |_, password|
  ActiveSupport::SecurityUtils.secure_compare(
    ::Digest::SHA256.hexdigest(password),
    ::Digest::SHA256.hexdigest(ENV["JOB_ADMIN_PASSWORD"])
  )
end

Rails.application.routes.draw do
  mount Sidekiq::Web, at: "/jobs"

  # get "/auth/github/callback", to: "sessions#create"
  # get "/sign_out", to: "sessions#destroy"

  get "/pages/*id" => "pages#show", :as => :pages, :format => false

  %w[404 422 500].each do |status_code|
    get status_code, to: "errors#show", code: status_code
  end

  resource :search, only: :show

  resources :resources

  root to: "pages#home"
end

require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'net/http'

Bundler.require(*Rails.groups)

module Helpdesk
  class Application < Rails::Application
    config.middleware.delete Rack::Lock
    config.middleware.use FayeRails::Middleware, mount: '/faye', :timeout => 25
  end
end

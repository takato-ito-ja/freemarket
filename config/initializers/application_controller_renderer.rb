
require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)


  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
      config.i18n.default_locale = :ja  
      config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s
    end
    
  end
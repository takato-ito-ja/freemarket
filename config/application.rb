require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FreemarketSample67e
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
      config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    end
    
  end
end

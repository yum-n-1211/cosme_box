require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CosmeBox
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.autoload_paths += Dir.glob("#{config.root}/app/forms")
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config/locales/models/*.yml').to_s]
    config.i18n.load_path += Dir[Rails.root.join('config/locales/*.yml').to_s]

    Rails.application.config.assets.paths << Rails.root.join("public", "assets", "images")
    Rails.application.config.assets.paths << Rails.root.join("public", "assets", "stylesheets")
    Rails.application.config.assets.paths << Rails.root.join("public", "assets", "javascripts")

  end
end

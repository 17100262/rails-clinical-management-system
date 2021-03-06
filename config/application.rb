require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Freelance
  class Application < Rails::Application

    # GMT (Lisbon) by default
    config.time_zone = 'Lisbon'
    config.active_record.default_timezone = :local

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.active_job.queue_adapter = :sidekiq
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :pt
    I18n.locale = config.i18n.locale = config.i18n.default_locale
    # config.i18n.available_locales = [:en, :pt]


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

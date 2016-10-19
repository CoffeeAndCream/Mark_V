require_relative 'boot'

require 'rails/all'
require 'httparty'
require 'json'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MarkV
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: "smtp.mailgun.org",
      port: 587,
      domain: ENV['MAILGUN_DOMAIN'], # CHANGE THIS
      authentication: "plain",
      enable_starttls_auto: true,
      user_name: ENV['MAILGUN_SMTP_USERNAME'], # CHANGE THIS
      password: ENV['MAILGUN_SMTP_PASSWORD'] # CHANGE THIS
}
  end
end

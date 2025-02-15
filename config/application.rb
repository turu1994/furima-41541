require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Furima41541
  class Application < Rails::Application
    config.load_defaults 7.1
    config.autoload_lib(ignore: %w(assets tasks))
    config.active_storage.variant_processor = :mini_magick


  end
end

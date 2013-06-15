require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module DataEngineering
  class Application < Rails::Application
    # Requiring tools in /lib, namely for the addition of my data uploader using resque
    config.autoload_paths += %W(#{config.root}/lib)
  end
end

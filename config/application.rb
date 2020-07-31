require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module Tourapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.assets.initialize_on_precompile = false
    
    config.generators do |g|
      g.test_framework :rspec,
                      helper_specs: false,
                      routing_specs: false,
                      view_specs: false,
                      controller_specs: false
    end 
  
    config.generators.system_tests = nil
  end
end


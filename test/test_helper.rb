require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  fixtures :all
  include Warden::Test::Helpers
  Warden.test_mode!
end

# Chromedriver.set_version "2.28"

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => { args: %w( disable-gpu) })
  Capybara::Selenium::Driver.new app, browser: :chrome, desired_capabilities: capabilities
end
Capybara.save_path = Rails.root.join('tmp/capybara')
Capybara.javascript_driver = :headless_chrome

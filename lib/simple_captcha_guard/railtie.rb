# lib/simple_captcha_guard/railtie.rb
require 'rails/railtie'

module SimpleCaptchaGuard
  class Railtie < Rails::Railtie
    initializer 'simple_captcha_guard.controller' do
      ActiveSupport.on_load(:action_controller_base) do
        include SimpleCaptchaGuard::CaptchaHelper
      end
    end

    initializer 'simple_captcha_guard.view' do
      ActiveSupport.on_load(:action_view) do
        include SimpleCaptchaGuard::CaptchaHelper
      end
    end
  end
end

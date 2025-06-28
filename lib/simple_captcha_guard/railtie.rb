module SimpleCaptchaGuard
  class Railtie < Rails::Railtie
    initializer "simple_captcha_guard.helpers" do
      ActiveSupport.on_load(:action_view) do
        include SimpleCaptchaGuard::CaptchaHelper
      end
    end
  end
end

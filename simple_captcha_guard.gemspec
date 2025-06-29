Gem::Specification.new do |spec|
  spec.name          = "simple_captcha_guard"
  spec.version       = "0.1.3"
  spec.authors       = "Ahmed Mahir Tazwar"
  spec.email         = "tazwarutshas@gmail.com"
  spec.summary       = "Simple CAPTCHA gem for Rails"
  spec.description   = "A simple CAPTCHA system to block bots in Rails apps."
  spec.homepage      = "https://medium.com/@tazwarutshas/simplecaptchaguard-add-captcha-protection-to-your-rails-forms-in-seconds-785413d3b807"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]
  spec.add_dependency "mini_magick", "~> 4.11"
  spec.required_ruby_version = ">= 3.0"
end

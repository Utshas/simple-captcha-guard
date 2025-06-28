Gem::Specification.new do |spec|
  spec.name          = "simple_captcha_guard"
  spec.version       = "0.1.1"
  spec.authors       = "Ahmed Mahir Tazwar"
  spec.email         = "tazwarutshas@gmail.com"
  spec.summary       = "Simple CAPTCHA gem for Rails"
  spec.description   = "A simple CAPTCHA system to block bots in Rails apps"
  spec.homepage      = "https://github.com/Utshas/simple-captcha-guard"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]
  spec.add_dependency "mini_magick"
end

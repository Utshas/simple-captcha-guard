module SimpleCaptchaGuard
  module CaptchaHelper
    def captcha_tag
      captcha = SimpleCaptchaGuard::Captcha.new
      session[:rewsna_ahctpac] = captcha.code.reverse

      blob = captcha.generate_image
      puts "Generated CAPTCHA code: #{captcha.code}"
      puts "Blob size: #{blob.bytesize} bytes"

      image_data = Base64.strict_encode64(blob)
      raw "<img src='data:image/png;base64,#{image_data}' alt='CAPTCHA'>"
    end


    def verify_captcha(input)
      input.to_s.strip.upcase.reverse == session[:rewsna_ahctpac]
    end
  end
end

require "mini_magick"
require "securerandom"
require "base64"
require "stringio"

module SimpleCaptchaGuard
  class Captcha
    attr_reader :code

    def initialize(length = 5)
      @code = SecureRandom.alphanumeric(length).upcase
    end

    def generate_image
      image = MiniMagick::Tool::Convert.new do |convert|
        convert.size "121x41"
        convert.gravity "center"
        convert.xc "white"
        convert.fill "black"
        convert.font "Helvetica"
        convert.pointsize "29"
        convert.draw "text 0,0 '#{@code}'"
        color_map = { 1 => "green", 2 => "red", 3 => "blue", 4 => "orange"}
        stroke_count = rand(6..7)
        stroke_count.times do
          convert.stroke "#{color_map[rand(1..4)]}"
          convert.strokewidth "#{rand(2)}"
          x1, y1 = rand(40), rand(38)
          x2, y2 = rand(65..120), rand(38)
          convert.draw "line #{x1},#{y1} #{x2},#{y2}"
        end
        convert.wave "3x55"
        convert << "png:-"
      end

      if image.is_a?(String)
        if image.include?("\0")
          # Definitely binary image data
          return image
        else
          # No null bytes, probably a file path, so check file existence safely
          return File.binread(image) if File.exist?(image)
        end
      end

      image
    end



  end
end

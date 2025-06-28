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
      MiniMagick::Tool::Convert.new do |convert|
        convert.size "121x41"
        convert.gravity "center"
        convert.xc "white"
        convert.fill "black"
        convert.font "Helvetica"
        convert.pointsize "29"
        convert.draw "text 0,0 '#{@code}'"
        color_map = { 1 => "green", 2 => "red", 3 => "blue", 4 => "orange"}
        # Add random lines (5 lines)
        stroke_count = rand(5..7)
        stroke_count.times do
          convert.stroke "#{color_map[rand(1..4)]}"           # line color
          convert.strokewidth "#{rand(2)}"       # line thickness
          x1, y1 = rand(40), rand(40)
          x2, y2 = rand(65..120), rand(40)
          convert.draw "line #{x1},#{y1} #{x2},#{y2}"
        end
        convert.wave "3x50"
        convert << "png:-"  # Output to stdout (returns binary blob)
        
      end.to_blob
    end

  end
end

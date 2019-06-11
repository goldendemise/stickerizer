# frozen_string_literal: true

require 'mini_magick'

class Stickerizer
  def stickerize(pic_file, save_dir)
    image = MiniMagick::Image.open(pic_file)
    image.resize '512x512'
    image.format 'png'
    image.write "#{save_dir}#{pic_file}"
  end
end

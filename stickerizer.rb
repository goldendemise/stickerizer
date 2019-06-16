# frozen_string_literal: true

require 'mini_magick'
require_relative 'file_nav'

class Stickerizer

  Extension = Struct.new(:extension)

  def file_ext(filename)
    Extension.new(filename[-4..-1])
  end

  def initialize
    @convert = DirTermine.new
  end

  def stickerize(pic_file, save_dir)
    image = MiniMagick::Image.open(pic_file)
    image.resize '512x512'
    image.format 'PNG'
    image.write(save_dir + '/' + stickername(pic_file))
    puts "#{pic_file} | #{save_dir}"
  end

  def stickername(filename)
    "#{filename[0..-5]}_sticker.png"
  end

  def origin_dir
    @convert.origin_dir
  end

  def dest_dir
    @convert.destination_dir
  end

  def valid?(file)
    valid = false
    file_info = file_ext(file)
    valid = true if file_info.extension == '.png'
    valid = true if file_info.extension == '.jpg'
    valid = true if file_info.extension == '.gif'
    puts "File #{file}: valid: #{valid}"
    valid
  end

  def convert_images
    origin = origin_dir
    destination = dest_dir
    Dir.children(origin).each do |unstickerized|
      next unless valid?(unstickerized)
      stickerize(unstickerized, destination)
    end
  end
end

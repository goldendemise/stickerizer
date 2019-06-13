# frozen_string_literal: true

require 'mini_magick'
require_relative 'file_nav'

class Stickerizer
  def initialize
    @convert = DirTermine.new
  end

  def stickerize(pic_file, save_dir)
    image = MiniMagick::Image.open(pic_file)
    image.resize '512x512'
    image.format 'png'
    image.write "#{save_dir}#{pic_file}_stickerized.png"
  end

  def origin_dir
    @convert.origin_dir
  end

  def dest_dir
    @convert.destination_dir
  end

  def valid?(file)
    valid = false
    extension = file[-4..-1]
    valid = true if extension == '.png'
    valid = true if extension == '.jpg'
    valid = true if extension == '.gif'
    puts "File #{file}: valid: #{valid.to_s}"
    valid
  end

  def convert_images
    origin = origin_dir
    destination = dest_dir
    Dir.children(origin).each do |unstickerized|
      next unless valid?(unstickerized)
      stickerize("#{origin}/#{unstickerized}", destination)
    end
  end
end

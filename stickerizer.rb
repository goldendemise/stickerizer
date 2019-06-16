# frozen_string_literal: true

require 'mini_magick'
require_relative 'file_nav'

class Stickerizer

  Extension = Struct.new(:extension)

  def file_ext(filename)
    Extension.new(filename[-4..-1])
  end

  ImageFormat = Struct.new(:size, :format)

  def telegram_format
    ImageFormat.new('512x512', 'PNG')
  end

  def initialize
    @convert = DirTermine.new
  end

  def stickerize(pic_file, save_dir)
    sticker_format = telegram_format
    image = MiniMagick::Image.open(pic_file)
    image.resize sticker_format.size
    image.format sticker_format.format
    image.write(save_dir + '/' + stickername(pic_file))

  end

  def stickername(filename)
    file_only = filename.sub %r{/.+/}, ''
    "#{file_only[0..-5]}_sticker.png"
  end

  def origin_dir
    @convert.origin_dir
  end

  def dest_dir
    @convert.destination_dir
  end

  def valid?(file)
    # TODO: Change this to check file types instead of relying on filenames
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
    puts "#{origin} is origin"
    Dir.children(origin).each do |unstickerized|
      next unless valid?(unstickerized)

      stickerize("#{origin}/#{unstickerized}", destination)
    end
  end
end

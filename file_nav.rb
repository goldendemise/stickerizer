# frozen_string_literal: true

class DirTermine

  attr_accessor :save_dir, :source_dir

  def initialize
     @save_dir = save_dir
     @source_dir = source_dir
  end

  def default_dir
    File.expand_path('~/Pictures/stickerized')
  end

  def create_dir(dir)
    Dir.mkdir(File.expand_path(dir)) unless File.directory?(File.expand_path(dir))
  end

  def destination_dir
    puts 'Please enter desired save directory (Leave blank for ~/Pictures/stickerized)'
    dir = gets.chomp
    dir = default_dir unless File.directory?(File.expand_path(dir))
    create_dir(dir)
    puts File.expand_path(dir) + " IS DESTINATION"
    return File.expand_path(dir)
  end

  def origin_dir
    puts 'Please enter directory containing pictures to stickerize (Leave blank for current directory)'
    dir = gets.chomp
    dir = Dir.getwd if dir.empty?
    puts File.expand_path(dir) + " IS ORIGIN"
    File.expand_path(dir)
  end

end

# frozen_string_literal: true
# TODO: add recursion support to directories
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
    dir = default_dir if dir.empty? || dir.nil?
    create_dir(dir)
    File.expand_path(dir)
  end

  def origin_dir
    puts 'Please enter directory containing pictures to stickerize (Leave blank for current directory)'
    dir = gets.chomp
    dir = Dir.getwd if dir.empty?
    File.expand_path(dir)
  end

end

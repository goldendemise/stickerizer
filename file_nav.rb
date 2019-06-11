# frozen_string_literal: true

class DirTermine

  attr_accessor :save_dir, :source_dir

  def initialize
    @save_dir = save_dir
    @source_dir = source_dir
  end

  def destination_dir
    puts 'Please enter desired save directory (Leave blank for ~/Pictures/stickerized)'
    dir = gets.chomp
    '~/Pictures/stickerized' if dir.empty?
  end

  def origin_dir
    puts 'Please enter directory containing pictures to stickerize (Leave blank for current directory)'
    dir = gets.chomp
    Dir.getwd if dir.empty?
  end

  def establish_dirs
    @source_dir = File.expand_path(origin_dir)
    @save_dir = File.expand_path(destination_dir)
  end

  def dbug
    puts @source_dir
    puts @save_dir
  end
end

testr = DirTermine.new
testr.establish_dirs
testr.dbug

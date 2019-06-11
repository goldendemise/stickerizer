# frozen_string_literal: true

class DirTermine
  def initialize
    @save_dir = save_dir
    @to_resize = to_resize
  end

  def destination_dir
    puts 'Please enter desired save directory (Leave blank for ~/Pictures/stickerized)'
    dir = gets.chomp

  end

  def origin_dir
    puts 'Please enter directory containing pictures to stickerize (Leave blank for current directory)'
    dir = gets.chomp
  end

  def dir_check(path)
    if Dir.exists?(File.expand_path(path))

    else

    end
  end
end

testr = DirTermine.new
testr.save_dir

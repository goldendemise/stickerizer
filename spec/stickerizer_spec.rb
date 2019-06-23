require './lib/stickerizer'

RSpec.describe Stickerizer do
  describe '#file_ext' do

    it 'returns the last four characters of a string' do
      stickerizer = Stickerizer.new
      expect(stickerizer.file_ext('bananas.png').extension).to eql('.png')
    end
  end
  describe '#valid?' do
    it 'returns false when given an unsupported file extension' do
      stickerizer = Stickerizer.new
      expect(stickerizer.valid?('pork.txt')).to eql(false)
    end

    it 'returns true when given a supported image format' do
      stickerizer = Stickerizer.new
      expect(stickerizer.valid?('buenosdias.png')).to eql(true)
    end
  end

end

require_relative '../lib/holelayout.rb'

describe HoleLayout do
  let(:path) {'/Users/jhylau/dropbox/launch_academy/golf/lib/golf_score.txt'}

  context 'loading data' do
    it 'reads in a file path' do
      holelayout = HoleLayout.new(path)
      expect(holelayout).to be_true
    end

    it 'returns an array of scores' do
      holelayout = HoleLayout.new(path)
      expect(holelayout.load.class).to eq(Array)
    end

    it 'returns the same array that we put in' do
      holelayout = HoleLayout.new(path)
      expect(holelayout.load).to eq([4,4,4,5,4,3,4,5,4,3,4,5,4,3,4,5,3,4])
    end
  end
end

require_relative '../lib/holelayout.rb'
require_relative '../lib/scores.rb'
require_relative '../lib/output.rb'

describe 'Golf' do
  let(:score_path) {'/Users/jhylau/dropbox/launch_academy/golf/lib/scores.txt'}
  let(:hole_path) {'/Users/jhylau/dropbox/launch_academy/golf/lib/golf_score.txt'}

  describe HoleLayout do
    it 'reads in a file path' do
      holelayout = HoleLayout.new(hole_path)
      expect(holelayout).to be_true
    end

    context 'parsing data' do
      it 'returns an array of scores' do
        holelayout = HoleLayout.new(hole_path)
        expect(holelayout.parse.class).to eq(Array)
      end

      it 'returns an array with 18 elements' do
        holelayout = HoleLayout.new(hole_path)
        expect(holelayout.parse.length).to eq(18)
      end
    end
  end


  describe Scores do
      context 'parsing data' do
          it 'reads in a file path' do
            scores = Scores.new(score_path)
            expect(scores).to be_true
          end

          it 'returns an array of player names followed by scores' do
            scores = Scores.new(score_path)
            expect(scores.parse.class).to eq(Array)
          end

          it 'returns an array with 3 elements' do
            scores = Scores.new(score_path)
           expect(scores.parse.length).to eq(3)
          end
       end
  end


  describe Output do

      context 'outputs individual results' do
        it 'takes in an instance of holelayout and an instance of score' do
          output = Output.new(Scores.new(score_path),HoleLayout.new(hole_path))
          expect(output).to be_true
       end
     end
  end
end


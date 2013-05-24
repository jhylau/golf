require_relative '../lib/holelayout.rb'
require_relative '../lib/playerresults.rb'
require_relative '../lib/scorecard.rb'

describe 'Golf' do
  let(:score_path) {'/Users/jhylau/dropbox/launch_academy/golf/lib/default_scores.txt'}
  let(:hole_path) {'/Users/jhylau/dropbox/launch_academy/golf/lib/default_hole_layout.txt'}
  
  describe HoleLayout do
    let(:holelayout) {HoleLayout.new(hole_path)}
    it 'reads in a file path' do
      expect(holelayout).to be_true
    end

    context 'parsing data' do
      it 'returns an array of scores' do
        expect(holelayout.parse.class).to eq(Array)
      end

      it 'returns an array with 18 elements' do
        expect(holelayout.parse.length).to eq(18)
      end
    end
  end

  describe PlayerResults do
      let(:player_results) {PlayerResults.new(score_path)}
      context 'parsing data' do
          it 'reads in a file path' do
            expect(player_results).to be_true
          end

          it 'returns an array of player names and scores' do
            expect(player_results.parse.class).to eq(Array)
          end

          it 'returns an array with 3 elements' do
           expect(player_results.parse.length).to eq(3)
          end
       end
  end

  describe ScoreCard do
      let(:player_info) do 
        player_results = PlayerResults.new(score_path)
        player_info = player_results.parse
        return player_info
      end

      let(:holelayout) {HoleLayout.new(hole_path).parse}

      let(:scorecard) {ScoreCard.new(player_info,holelayout)}

      it 'takes in an array of  holelayout and an instance of score' do
        expect(scorecard).to be_true
      end

      it 'returns the number of players' do
        expect(scorecard.number_of_players).to be(3)
      end

      it 'returns an array of player names' do
        expect(scorecard.player_names).to include('Tiger Woods','Lau','Bubba Wats')
      end

      it 'returns an array of player scores' do
        expect(scorecard.player_scores.class).to be(Array)
      end

      it 'returns hole results as a string' do
        expect(scorecard.hole_results(1,1,'Par')).to include('1','1','Par')
      end

      it 'converts par_score and player_score to string' do     
        expect(scorecard.convert_score_to_name(1,1)).to include('Par')
      end

      it 'calculates total scores' do
        expect(scorecard.calculate_total_score([1,1,1])).to be(3)
      end

      it 'has an output method' do
        expect(scorecard.output).to be_true
      end
  end

end


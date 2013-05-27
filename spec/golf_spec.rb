require_relative '../lib/holelayout.rb'
require_relative '../lib/playerresults.rb'
require_relative '../lib/scorecard.rb'
require_relative '../lib/leaderboard.rb'
require 'pry'

describe 'Golf Assignment:' do
  let(:score_path) {'/Users/jhylau/dropbox/launch_academy/golf/lib/default_scores.txt'}
  let(:hole_path) {'/Users/jhylau/dropbox/launch_academy/golf/lib/default_hole_layout.txt'}
  
  describe HoleLayout do
    let(:holelayout) {HoleLayout.new(hole_path)}
    it 'reads in a file path' do
      expect(holelayout).to be_true
    end

    context 'parsing data' do
      it 'returns an array of scores' do
        expect(holelayout.course_numbers.class).to eq(Array)
      end

      it 'returns an array with 18 elements' do
        expect(holelayout.course_numbers.length).to eq(18)
      end

      it 'returns an error message if the input is incorrect length' do
        hole_path_incorrect = '/Users/jhylau/dropbox/launch_academy/golf/lib/default_incorrect_layout.txt'
        expect {HoleLayout.new(hole_path_incorrect)}.to raise_error 'Check your inputs'
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
            expect(player_results.results.class).to eq(Array)
          end

          it 'returns an array with 3 elements' do
           expect(player_results.results.length).to eq(3)
          end

          it 'returns an error message if the input is incorrect length' do
            default_incorrect_scores = '/Users/jhylau/dropbox/launch_academy/golf/lib/default_incorrect_scores.txt'
            expect {PlayerResults.new(default_incorrect_scores)}.to raise_error 'Check your inputs'
          end
       end
  end

  describe ScoreCard do
      let(:player_info) {PlayerResults.new(score_path).results}

      let(:holelayout) {HoleLayout.new(hole_path).course_numbers}

      let(:scorecard) {ScoreCard.new(player_info[0],holelayout)}

      it 'takes in an array of holelayout and a hash with player info' do
        expect(scorecard).to be_true
      end

      it 'returns an array of player names' do
        expect(scorecard.player_name).to include('Tiger Woods')
      end

      it 'returns an array of player info' do
        expect(scorecard.player_name.length).to be(1)
      end

      it 'returns an array of player scores' do
        expect(scorecard.scores.class).to be(Array)
      end

      it 'returns hole results as a string' do
        expect(scorecard.hole_results(1,1,'Par')).to include('1','1','Par')
      end

      it 'converts par_score and player_score to string' do     
        expect(scorecard.convert_score_to_name(1,1)).to include('Par')
      end

      it 'returns an array of player results strings' do
        expect(scorecard.player_results_as_array.length).to be(18)
      end

      it 'calculates total scores' do
        expect(scorecard.total_score).to be(72)
      end

      it 'calculates score below par' do
        expect(scorecard.score_below_par).to be(0)
      end

      it 'has an output method' do
        expect(scorecard.output).to be_nil
      end
    end

    describe LeaderBoard do
      let(:player_info) do 
        player_results = PlayerResults.new(score_path).results
      end

      let(:holelayout) {HoleLayout.new(hole_path).course_numbers}

      let(:scorecard) {ScoreCard.new(player_info[0],holelayout)}

      let(:scorecards_array) do
        scorecards_array = []
        player_info.length.times do |i|
          scorecards_array << ScoreCard.new(player_info[i],holelayout)
        end
        return scorecards_array
      end

      it 'takes in an array of scorecards' do
        leaderboard = LeaderBoard.new(scorecards_array)
      end

      it 'returns a sorted array of scores below par' do
        leaderboard = LeaderBoard.new(scorecards_array)
        expect(leaderboard.scores).to eql([0,1,2])
      end

      it 'outputs information' do
        leaderboard = LeaderBoard.new(scorecards_array)
        expect(leaderboard.output).to be_true
      end
    end

end


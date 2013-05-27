require_relative 'scorecard'
require_relative 'playerresults'
require_relative 'holelayout'

class LeaderBoard
  def initialize(scorecard_array)
    sorted_array = scorecard_array.sort_by {|x| x.score_below_par}
    @scorecard_array = sorted_array
  end


  def scorecard_array
    @scorecard_array
  end

  def scores
    scores = []
    scorecard_array.length.times do |i|
      scores <<  scorecard_array[i].score_below_par
    end
    scores
  end

  def output
    scorecard_array.length.times do |i|
      puts scorecard_array[i].output
    end
    puts "LeaderBoard"
    scorecard_array.length.times do |i|
      puts "#{scorecard_array[i].score_below_par} #{scorecard_array[i].total_score} #{scorecard_array[i].player_name}"  
    end    
  end
end

# score_path = '/Users/jhylau/dropbox/launch_academy/golf/lib/default_scores.txt'
# hole_path = '/Users/jhylau/dropbox/launch_academy/golf/lib/default_hole_layout.txt'

# player_results = PlayerResults.new(score_path).results
# holelayout = HoleLayout.new(hole_path).parse

# scorecards_array = []
# player_results.length.times do |i|
#   scorecards_array << ScoreCard.new(player_results[i],holelayout)
# end

# leaderboard = LeaderBoard.new(scorecards_array)
# leaderboard.output

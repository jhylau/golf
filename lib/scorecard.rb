require_relative 'scores'
require_relative 'holelayout'
require_relative 'player'
require_relative 'printholeresults'

class ScoreCard
  attr_accessor :scores, :holelayout
  def initialize(scores,holelayout)
    @scores = scores
    @holelayout = holelayout
  end

  def players_number
    scores.parse.length
  end

  def output
    scores.parse.each do |item|
      output << "==#{item.keys[0]}"
      total_score = 0
      18.times do |i|
        score = item.values.flatten[i].to_i
        total_score += score
        hole_number = i + 1
        par_score = holelayout.parse[i]
        print_line = PrintHoleResults.new(score,hole_number,par_score).output
        puts print_line
      end
      puts "Total score: #{total_score}"
    end
  end
end
score_path=  '/Users/jhylau/dropbox/launch_academy/golf/lib/scores.txt'
hole_path = '/Users/jhylau/dropbox/launch_academy/golf/lib/golf_score.txt'
scorecard = ScoreCard.new(Scores.new(score_path),HoleLayout.new(hole_path))
scorecard.output

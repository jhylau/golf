require_relative 'scores'
require_relative 'holelayout'
require_relative 'player'

class ScoreCard
  attr_accessor :scores, :holelayout
  def initialize(scores,holelayout)
    @scores = scores
    @holelayout = holelayout
  end

  def players_number
    scores.parse.length
  end


end

class ScoreCard
  attr_accessor :player_info, :holelayout
  def initialize(player_info,holelayout)
    @player_info = player_info
    @holelayout = holelayout
  end

  def player_info
    @player_info
  end

  def player_name
    player_name = player_info.keys
  end

  def scores
    scores = player_info.values.flatten
  end

  def convert_score_to_name(par_score,player_score)
    results = par_score - player_score
    case results
    when 1
        '- Birdie'
      when 2
        '- Eagle'
      when  3
        '- Aced'
      when 0
        '- Par'
      when -1
        '- Bogey'
      when -2
        '- Double Bogey'
      when -3
        '- Triple Bogey'
      else 
        ''
    end
  end

  def hole_results(hole_number, player_score, score_name)
    "Hole #{hole_number}: #{player_score} #{score_name}"
  end

  def total_score
      total_score = 0
      scores.each { |a| total_score +=a.to_i }
      total_score
  end

  def player_results_as_array
    player_results_text = []
    18.times do |i|
        score = scores[i].to_i
        par_score = holelayout[i].to_i
        hole_number = i + 1
        score_name = convert_score_to_name(par_score, score)
        player_results_text << hole_results(hole_number, score, score_name)
      end
    player_results_text
  end

  def score_below_par
    score_below_par =  total_score - 72
  end

  def output
      puts player_name
      puts player_results_as_array
      puts "Total score is #{total_score}"
      puts score_below_par
  end
end

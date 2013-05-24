class PrintHoleResults
  def initialize(score, hole_number, par_score)
    @score = score
    @hole_number = hole_number
    @par_score = par_score
  end

  def hole_number
    @hole_number
  end

  def par_score
    @par_score
  end

  def score
    @score
  end

  def score_name
    results = par_score - score
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

  def output
    "Hole #{hole_number}: #{score} #{score_name}"
  end
end

class Player
  def initialize(information)
    @information = information
  end

  def name
    @information.keys
  end

  def golf_score
    @information.values
  end

  def total_score
  end

end

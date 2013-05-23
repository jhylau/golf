require 'csv'

class HoleLayout
  attr_accessor :filepath

  def initialize(filepath)
    @filepath = filepath
  end

  def load
    array = []
    CSV.foreach(filepath) do |line|
      line.each do |a|
        array << a.to_i
      end
    end
    return array
  end

end

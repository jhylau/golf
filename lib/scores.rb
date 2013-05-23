class Scores
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def parse
    array = []
    CSV.foreach(path) do |line|
        hash = {}
        hash[line[0]] = line[1..(line.length-1)]
        array << hash
    end
    return array
  end

end

class PlayerResults
  def initialize(path)
    @path = path
  end

  def path
    @path
  end

  def parse
    array = []
    CSV.foreach(path) do |line|
        hash = {}
        name = line[0].to_s
        scores =  line[1..(line.length-1)].flatten
        hash[name] = scores
        array << hash
    end
    return array
  end
end

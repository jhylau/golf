require 'csv'

class PlayerResults
  attr_accessor :results

  def initialize(path)
    @path = path
    @results = []
    parse
  end

  def path
    @path
  end

  def parse
    CSV.foreach(path) do |line|
        hash = {}
        name = line[0].to_s
        scores =  line[1..(line.length-1)].flatten
        hash[name] = scores
        results << hash
        if scores.length != 18
          raise 'Check your inputs' 
        end
    end
    return results
  end
end

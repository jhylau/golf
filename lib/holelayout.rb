require 'csv'

class HoleLayout
  attr_accessor :course_numbers

  def initialize(filepath)
    @filepath = filepath
    @course_numbers = []
    parse
  end

  def filepath
    @filepath
  end

  def parse
    CSV.foreach(filepath) do |line|
      line.each do |a|
        course_numbers << a.to_i
      end
    end

    if course_numbers.length != 18 
      raise 'Check your inputs' 
    end

    return course_numbers
  end
end

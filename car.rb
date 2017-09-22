# car class with basic details
class Car
  # reader for name and color fields
  attr_reader :name, :color
  def initialize(name, color)
    # Instance variables
    @name = name
    @color = color
  end

  def display
    puts "car #{@name} of color #{@color}"
  end
end

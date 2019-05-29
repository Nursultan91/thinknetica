require_relative 'train'
# require_relative 'passenger'

class Cargo < Train
  def initialize(number)
    @number = number
    @type = initial_type
    @wagons = []
    @speed = 0
  end

  def initial_type
    "Cargo"
  end
end

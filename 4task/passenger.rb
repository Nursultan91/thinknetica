require_relative 'train'
# require_relative 'cargo'
require 'pry'

class Passenger < Train
  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    @type = initial_type
  end

  def initial_type
    "Passenger"
  end
end

ewq = Passenger.new(1)
puts ewq
pry
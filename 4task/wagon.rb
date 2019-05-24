class Wagon
  attr_reader :type
end
class CargoWagon < Wagon
  def initialize
    @type = "Cargo"
  end
end

class PassengerWagon < Wagon
  def initialize
    @type = "Passenger"
  end
end
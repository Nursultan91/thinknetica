require_relative 'train'

class PassengerTrain < Train
  def initialize(number)
    @type = "Passenger"
    super
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
  end
end

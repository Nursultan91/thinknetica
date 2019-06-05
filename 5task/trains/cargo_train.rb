require_relative 'train'

class CargoTrain < Train
  def initialize(number)
    @number = number
    @type = "Cargo"
    @train_wagons = []
    @speed = 0
    @@trains[number] = self
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end
end

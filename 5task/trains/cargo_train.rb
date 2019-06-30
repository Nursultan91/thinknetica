require_relative 'train'

class CargoTrain < Train
  def initialize(number)
    @type = "Cargo"
    super
  end

  def attachable_wagon?(wagon)
    wagon.is_a?(CargoWagon)
  end
end

class Train
  attr_reader :number, :type, :wagon_count
  def initialize(number, type, wagon_count)
    @number = number
    @type = type
    @wagon_count = wagon_count
  end
end
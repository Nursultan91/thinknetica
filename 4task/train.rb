require_relative 'wagon'
class Train
  attr_reader :number, :type, :wagons, :route, :speed, :current_station_index
  def increase_speed(speed)
    @speed += speed
  end

  def decrease_speed(speed)
    @speed -= speed
    @speed = 0 if @speed < 0
  end

  def stop
    @speed = 0
  end

  def add_wagon
    return unless @speed == 0
    if self.class == Cargo
      new_wagon = CargoWagon.new
    else
      new_wagon = PassengerWagon.new
    end
    @wagons << new_wagon
  end

  def del_wagon
    return unless @speed == 0
    puts "Выберите Вагон по индексу"
    list_of_wagons
    @wagons.delete_at(gets.to_i)
    list_of_wagons
  end

  def list_of_wagons
    @wagons.each_with_index { |wagon, index | puts "#{index} - #{wagon}" }
  end

  def take_route(route)
    @route = route
    @current_station_index = 0
    current_station.park_train(self)
  end

  def current_station
    route.stations[@current_station_index]
  end

  def go_front
    return if next_station.nil?
    current_station.send_train(self)
    next_station.park_train(self)
    @current_station_index += 1
  end

  def go_back
    return if previous_station.nil?
    current_station.send_train(self)
    previous_station.park_train(self)
    @current_station_index -= 1
  end

  def next_station
    route.stations[@current_station_index + 1]
  end

  def previous_station
    return unless @current_station_index > 0
    route.stations[@current_station_index - 1]
  end
end

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

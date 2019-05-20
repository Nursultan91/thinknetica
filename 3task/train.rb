class Train
  attr_reader :number, :type, :wagons, :route, :speed, :current_station_index

  def initialize(number, type, wagons, speed = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed = speed
  end

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
    @wagons += 1
  end

  def del_wagon
    @wagons -= 1 if @wagons > 0
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
    unless self.current_station == self.route.stations.first
      current_station.send_train(self)
      current_station = previous_station
      current_station.park_train(self)
      @current_station_index -= 1
    end
  end

  def next_station
    route.stations[@current_station_index + 1]
  end

  def previous_station
    return unless @current_station_index > 0
    route.stations[@current_station_index - 1]
  end
end

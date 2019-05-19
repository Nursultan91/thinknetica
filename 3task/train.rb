class Train
  attr_reader :number, :type, :wagons, :route, :station, :speed, :current_station_index

  def initialize(number, type, wagons, speed = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed = speed
  end

  def stop
    self.speed = 0
  end

  def increase_speed(speed)
    @speed += speed
  end

  def decrease_speed(speed)
    if @speed > speed
      @speed -= speed
    end
  end

  def stop
    @speed = 0
  end

  def add_wagon
    @wagons += 1
  end

  def del_wagon
    @wagons -= 1 unless @wagons == 1
  end

  def take_route(route)
    @route = route
    @station = route.stations.first
    @station.park_train(self)
    @current_station_index = 0
  end

  def current_station
    route.stations[@current_station_index]
  end

  def go_front
    unless self.station == self.route.stations.last
      @station.send_train(self)
      @station = self.route.stations[@current_station_index+1]
      @station.park_train(self)
      @current_station_index += 1
    end
  end

  def go_back
    unless self.station == self.route.stations.first
      @station.send_train(self)
      @station = self.route.stations[@current_station_index-1]
      @station.park_train(self)
      @current_station_index -= 1
    end
  end

  def next_station
    unless self.station == self.route.stations.last
      self.route.stations[self.route.stations.index(self.station)+1]
    end
  end

  def previous_station
    unless self.station == self.route.stations.first
      self.route.stations[self.route.stations.index(self.station)-1]
    end
  end
end

class Train
  attr_reader :number, :type, :wagons, :route, :station
  attr_accessor :speed

  def initialize(number, type, wagons, speed = 0)
    @number = number
    @type = type
    @wagons = wagons
    @speed = speed
  end

  def stop
    self.speed = 0
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
  end

  def go_front
    unless self.station == self.route.stations.last
      @station.send_train(self)
      @station = self.route.stations[self.route.stations.index(self.station)+1]
      @station.park_train(self)
    end
  end

  def go_back
    unless self.station == self.route.stations.first
      @station.send_train(self)
      @station = self.route.stations[self.route.stations.index(self.station)-1]
      @station.park_train(self)
    end
  end

  def next
    unless self.station == self.route.stations.last
      puts self.route.stations[self.route.stations.index(self.station)+1].title
    end
  end

  def prev
    unless self.station == self.route.stations.first
      puts self.route.stations[self.route.stations.index(self.station)-1].title
    end
  end
end

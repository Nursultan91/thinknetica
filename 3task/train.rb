class Train
  attr_reader :number, :type, :wagons, :route, :station
  attr_accessor :speed

  def initialize(number, type, wagons, speed = 0)
    @number = number
    @type = type
    @wagons = wagons
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    @wagons +=1
  end

  def del_wagon
    @wagons -=1
  end

  def take_route(route)
    if route.instance_of? Route
      @route = route
      @station = route.stations.first
      @station.park_train(self)
    else
      puts "Train can't take #{route} as Route"
    end
  end

  def go_front
    if self.station == self.route.stations.last
      puts "We are on the last station. No way front"
    else
      @station.send_train(self)
      @station = self.route.stations[self.route.stations.index(self.station)+1]
      @station.park_train(self)
    end
  end

  def go_back
    if self.station == self.route.stations.first
      puts "We are on the first station. No way back"
    else
      @station.send_train(self)
      @station = self.route.stations[self.route.stations.index(self.station)-1]
      @station.park_train(self)
    end
  end

  def next
    if self.station == self.route.stations.last
      puts "We are on the last station. No way front"
    else
      puts self.route.stations[self.route.stations.index(self.station)+1].title
    end
  end

  def prev
    if self.station == self.route.stations.first
      puts "We are on the first station. No way back"
    else
      puts self.route.stations[self.route.stations.index(self.station)-1].title
    end
  end
end
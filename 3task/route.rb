class Route
  attr_reader :stations
  def initialize(first, last)
    if first.instance_of? Station and last.instance_of? Station
      @stations = [first, last]
    else
      puts "Route can contain only Stations"
    end
  end

  def add_station(station)
    if station.instance_of? Station
      if @stations.include?(station)
        puts "This route already has #{station.title} station"
      else
        @stations.insert(-2, station)
      end
    else
      puts "Only stations can be added to route"
    end
  end

  def del_station(station)
    if station.instance_of? Station
      if @stations.include?(station)
        @stations.delete(station)
      else
        puts "This route doesn't has #{station.title} station"
      end
    else
      puts "Only stations can be removed from route"
    end
  end
end
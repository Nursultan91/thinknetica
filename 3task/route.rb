class Route
  attr_reader :stations
  def initialize(first, last)
    @stations = [first, last]
  end

  def add_station(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def del_station(station)
    @stations.delete(station) unless station == @stations.last || station == @stations.first
  end
end

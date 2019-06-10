require_relative 'instance_counter'
class Route
  include InstanceCounter
  attr_reader :stations
  attr_accessor :instances

  def initialize(first, last)
    @stations = [first, last]
    register_instance
  end

  def add_station(station)
    @stations.insert(-2, station) unless @stations.include?(station)
  end

  def del_station(station)
    return if [@stations.first, @stations.last].include?(station)
    @stations.delete(station)
  end

  def info
    [stations.first.title, stations.last.title].join(' - ')
  end
end

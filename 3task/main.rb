require 'pry'
require_relative 'station'
require_relative 'train'
require_relative 'route'

wall = Station.new("Wall")
winterfell = Station.new("Winterfell")

north = Route.new(wall, winterfell)
north.add_station(wall)
north.add_station("dsa")
puts north.stations
north.rem_station("dsa")
puts north.stations
pry

require 'pry'
require_relative 'station'
require_relative 'train'
require_relative 'route'

wall = Station.new("Wall")
wf = Station.new("Winterfell")
hg = Station.new("Highgarden")
kl = Station.new("Kings Landing")
cr = Station.new("Casterly Rock")

north = Route.new(wall, wf)

sam = Train.new(1, "cargo", 4)
north.add_station(hg)
north.add_station(kl)
north.add_station(cr)
sam.take_route(north)
sam.go_front

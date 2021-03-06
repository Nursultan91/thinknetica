require 'pry'
require_relative 'station'
require_relative 'train'
require_relative 'route'

wall = Station.new("Wall")
wf = Station.new("Winterfell")
hg = Station.new("Highgarden")
kl = Station.new("Kings Landing")
cr = Station.new("Casterly Rock")
north = Route.new(wall, cr)
sam = Train.new(1, "cargo", 4)
john = Train.new(2, "cargo", 4)
davos = Train.new(3, "cargo", 4)
north.add_station(wf)
north.add_station(hg)
north.add_station(kl)
sam.take_route(north)
john.take_route(north)
davos.take_route(north)
pry

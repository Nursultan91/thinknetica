require 'pry'
require_relative 'station'
require_relative 'train'

ewq = Train.new(1, "cargo", 4)
dsa = Train.new(2, "cargo", 6)
cxz = Train.new(3, "pass", 8)

puts ewq
puts dsa
puts cxz

wall = Station.new("Wall")
wall.park_train(ewq)

wall.trains_by_type("cargo")

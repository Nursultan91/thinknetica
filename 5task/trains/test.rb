require_relative '../route'
require_relative 'train'
require_relative '../station'
require_relative 'passenger_train'
require_relative 'cargo_train'

wall = Station.new("wall")
dorn = Station.new("dorn")
north = Station.new("north")

ewq = Route.new(wall, dorn)
puts ewq.class.instances
puts wall.class.instances

# ewq = CargoTrain.new(123)
# dsa = CargoTrain.new(234)
# cxz = CargoTrain.new(345)
#
# qwe = PassengerTrain.new(321)
# asd = PassengerTrain.new(432)
# zxc = PassengerTrain.new(543)
#
# puts cxz.class.instances
# puts zxc.class.instances
# puts zxc.class.ancestors
# puts Station.instances
# puts Station.ancestors
#
# class Test
#   class << self
#     attr_accessor :var1
#   end
#   attr_accessor :var2
# end
#
# rewqrewq = Test.new
# rewqrewq.var2 = 432
# rewqrewq.class.var1 = 123
# puts rewqrewq.var2
# puts rewqrewq.class.var1
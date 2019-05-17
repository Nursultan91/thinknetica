require 'pry'
class Station
  attr_reader :title

  def initialize(title)
    @title = title
    @parked_trains = []
  end

  def park_train(train)
    @parked_trains.push(train)
  end

  def parked_trains
    @parked_trains
  end

  def train_by_types
    @parked_trains.each do |train|
      puts "#{train} - #{train.type}"
    end
  end

  def launch_train(train)
    @parked_trains.delete(train)
  end
end
class Route
  attr_reader :station_list

  def initialize(first_station, last_station)
    @station_list = [first_station, last_station]
  end

  def first_station
    @station_list.first.title
  end

  def last_station
    @station_list.last.title
  end

  def add_station(station)
    @station_list.insert(1,*station)
  end

  def delete_station(station)
    @station_list.delete(station)
  end

  def list_of_stations
    @station_list.each.with_index(1) {|station, index| puts "#{station.title} - #{index}"}
  end
end
class Train
  attr_accessor :speed
  attr_reader :number

  def initialize(number, type, wagons_num, speed = 0)
    @number = number
    @type = type
    @wagons_num = wagons_num
    @speed = speed
  end

  def stop
    self.speed = 0
  end

  def change_wagons(arg)
    stop
    if add
      @wagons_num +=1
    elsif rem
      @wagons_num -=1
    else
      puts "I Don'y know"
    end
  end

  def get_route(route)
    @current_route = route
    @current_station = route.station_list.first
    route.station_list.first.park_train(self)
    @current_station.park_train(self)
    @current_station_index = 0
  end

  def move(direction)
    @direction = direction
    if direction.to_s == "front"
      @current_station_index +=1
      @current_station = @current_route.station_list[@current_station_index]
    elsif direction.to_s == "back"
      @current_station_index +=1
      @current_station = @current_route.station_list[@current_station_index]
    else
      puts "I Don't know your direction"
    end
  end

  def current_route
    @current_route
  end

  def current_station
    @current_station.title
  end

  def next_station
    @current_route[@current_route.station_list(@station_list[index(@current_station) + 1])]
  end

  def prev_station
    @current_route[@current_route.index(@current_station) - 1]
  end
end

wall = Station.new("Wall")
winterfell = Station.new("Winterfell")
dredfort = Station.new("Dredfort")
riverrun = Station.new("Riverrun")
dragon_stone = Station.new("Dragon Stone")
highgarden = Station.new("HighGarden")

meister = Route.new(wall, highgarden)
meister.add_station(winterfell)

north_king = Route.new(wall, dragon_stone)
north_king.add_station(riverrun)
north_king.add_station(dredfort)
north_king.delete_station(dredfort)

sam = Train.new(1,"cargo",4,10)
john = Train.new(2,"pas",6,20)
puts sam
puts sam.number
sam.get_route(meister)
# puts sam.current_station
# puts sam.current_route
# puts sam.current_route.station_list.first.title
# puts sam.current_route.station_list.first.parked_trains.each {|t| puts "#{t.number}"}
# puts wall
puts wall.parked_trains.last


# puts sam.current_station
#
# puts sam.next_station
#
# puts meister
# puts meister.class
# puts meister.station_list.class
# puts meister.first_station
# puts meister.last_station
# puts meister.list_of_stations
# puts north_king.list_of_stations
# puts north_king.first_station
# puts north_king.last_station
# puts north_king.list_of_stations

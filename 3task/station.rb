class Station
  attr_reader :title, :parked_trains
  def initialize(title)
    @title = title
    @parked_trains = []
  end

  def park_train(train)
    puts "______________"
    if @parked_trains.include?(train)
      puts "Train #{train} is already parked on this station"
    else
      @parked_trains.push(train)
      puts "Train #{train} has been parked succesfully"
    end
    puts "______________"
  end

  def list_of_trains
    puts "______________"
    puts "The list of trains on #{self.title} Station"
    @parked_trains.each {|train| puts "Train - #{train}"}
    puts "______________"
  end

  def send_train(train)
    puts "______________"
    if @parked_trains.include?(train)
      @parked_trains.delete(train)
      puts "Train #{train} has been sended succesfully"
    else
      puts "Train #{train} is not on #{self.title} Station"
    end
    puts "______________"
  end
end

wall = Station.new("Wall")
wall.park_train("ewq")
wall.send_train("ewq")
wall.send_train("ewq")
wall.park_train("ewq")
wall.park_train("dsa")
wall.park_train("cxz")
puts wall.title
puts wall.list_of_trains
puts wall.parked_trains.count
puts wall.parked_trains.include?("ewq")
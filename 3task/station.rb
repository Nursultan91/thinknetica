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
  end

  def list_of_trains
    puts "______________"
    puts "The list of trains on #{self.title} Station"
    @parked_trains.each {|train| puts "Train - #{train}"}
  end

  def send_train(train)
    puts "______________"
    if @parked_trains.include?(train)
      @parked_trains.delete(train)
      puts "Train #{train} has been sended succesfully"
    else
      puts "Train #{train} is not on #{self.title} Station"
    end
  end

  def trains_by_type(type)
    puts "The list of train numbers with #{type} - type"
    @parked_trains.select {|train| train.type == type }.each do |train|
      print "#{train.number} "
      puts ""
    end
  end
end

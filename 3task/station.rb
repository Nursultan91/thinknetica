class Station
  attr_reader :title, :trains
  def initialize(title)
    @title = title
    @trains = []
  end

  def park_train(train)
    if train.instance_of? Train
      puts "______________"
      if @trains.include?(train)
        puts "Train #{train} is already parked on this station"
      else
        @trains.push(train)
        puts "Train #{train} has been parked succesfully on #{self.title} Station"
      end
    else
      puts "Only Trains can be parked. #{train} belongs to #{train.class} class"
    end
  end

  def list_of_trains
    puts "______________"
    puts "The list of trains on #{self.title} Station"
    @trains.each {|train| puts "Train - #{train}"}
  end

  def send_train(train)
    puts "______________"
    if @trains.include?(train)
      @trains.delete(train)
      puts "Train #{train} has been sended succesfully from #{self.title} Station"
    else
      puts "Train #{train} is not on #{self.title} Station"
    end
  end

  def trains_by_type(type)
    puts "The list of train numbers with #{type} - type"
    @trains.select {|train| train.type == type }.each do |train|
      print "#{train.number} "
      puts ""
    end
  end
end

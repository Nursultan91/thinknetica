class Station
  attr_reader :title, :trains

  @@stations = []

  def self.all
    puts @@stations
  end
  def initialize(title)
    @title = title
    @trains = []
    @@stations.push(self )
  end

  def park_train(train)
    @trains.push(train) unless @trains.include?(train)
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains_by_type(type)
    @trains.select {|train| train.type == type }.count
  end

  def info
    self.title
  end
end

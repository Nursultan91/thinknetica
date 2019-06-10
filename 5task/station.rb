require_relative 'instance_counter'
class Station
  extend InstanceCounter::ClassMethods
  attr_reader :title, :trains

  @@instances = 0

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(title)
    @title = title
    @trains = []
    @@stations << self
    @@instances += 1
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

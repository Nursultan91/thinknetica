require 'pry'
require_relative 'station'
require_relative 'train'
require_relative 'route'

class Main
  attr_reader :stations, :routes, :trains

  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  def create_station
    puts "Введите название станции"
    name = gets.chomp
    station = Station.new(name)
    @stations << station
  end

  def create_route
    puts "Введите номер первой станции выбрав ее из списка"
    @stations.each_with_index {|station, index| puts "#{index} - #{station.title}"}
    first_station_index = gets.to_i
    puts "Введите номер последней станции выбрав ее из списка"
    @stations.each_with_index {|station, index| puts "#{index} - #{station.title}"}
    last_station_index = gets.to_i
    route = Route.new(@stations[first_station_index], @stations[last_station_index])
    @routes << route
  end

  def create_train
    puts "Введите номер поезда"
    number = gets.to_i
    puts "Выберите тип: 1 - грузовой, 2 - пассажирский"
    train_type_choice = gets.to_i
    if train_type_choice == 1
      type = "cargo"
    elsif train_type_choice == 2
      type = "pass"
    else
      puts "Нет такого типа. Попробуйте еще раз"
    end
    puts "Введите количество вагонов"
    wagons = gets.to_i
    train = Train.new(number, type, wagons)
    @trains << train
  end

  def go
    loop do
      puts "Введите что вы хотите сделать?"
      puts "1 - создать станцию"
      puts "2 - создать маршрут"
      puts "3 - создать поезд"
      puts "quit - завершить программу"

      choice = gets.chomp
      break if choice == "quit"
      case choice.to_i
      when 1
        create_station
      when 2
        create_route
      when 3
        create_train
      else
        puts "Я не знаю чего ты хочешь"
      end
    end
  end
end

asoiaf = Main.new
asoiaf.go
pry
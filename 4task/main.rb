require 'pry'
require_relative 'station'
require_relative 'train'
require_relative 'route'

class Main
  attr_reader :stations, :routes, :trains

  def run
    loop do
      show_main_menu
      choice = gets.chomp
      break if choice == "quit"
      case choice.to_i
      when 1 then work_with_stations
      when 2 then work_with_routes
      when 3 then work_with_trains
      else puts "Я не знаю чего ты хочешь"
      end
    end
  end

  private

  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  # Stations
  def work_with_stations
    loop do
      show_stations_menu
      choice = gets.to_i
      break if choice == 0
      case choice
      when 1 then create_station
      when 2 then stations_list
      else error_index
      end
    end
  end
  def show_stations_menu
    puts "Введите 1 для создания станции"
    puts "Введите 2 чтобы увидеть список всех станций"
    puts "Введите 0 чтобы выйти в предыдущее меню"
  end
  def create_station
    puts "Введите название станции"
    name = gets.chomp
    station = Station.new(name)
    @stations << station
  end
  def stations_list
    @stations.each_with_index { |station, index| puts "#{index + 1}-я Станция - #{station.title}" }
  end
  # Routes
  def work_with_routes
    loop do
      show_routes_menu
      choice = gets.to_i
      break if choice == 0
      case choice
      when 1 then create_route
      when 2 then route_list
      when 3 then show_route
      when 4 then add_station_to_route
      when 5 then remove_station_from_route
      else puts "Я не понял чего ты хочешь"
      end
    end
  end
  def show_routes_menu
    puts "Введите 1 для создания маршрута"
    puts "Введите 2 чтобы увидеть список всех маршрутов"
    puts "Введите 3 чтобы рассмотреть конкретный маршрут"
    puts "Введите 4 чтобы добавить станцию к марщруту"
    puts "Введите 5 чтобы удалить станцию из марщрута"
    puts "Введите 0 чтобы выйти в предыдущее меню"
  end
  def create_route
    if @stations.length < 2
      puts "Для создания маршрута необходимо создать минимум две станции"
      puts "Создать станцию - 1, предыдущее меню - нажмите любую клавишу"
      user_choice = gets.to_i
      if user_choice == 1
        create_station
      end
    else
      puts "Введите номер первой станции выбрав ее из списка"
      @stations.each_with_index {|station, index| puts "#{index} - #{station.title}"}
      first_station_index = gets.to_i
      puts "Введите номер последней станции выбрав ее из списка"
      @stations.each_with_index {|station, index| puts "#{index} - #{station.title}"}
      last_station_index = gets.to_i
      route = Route.new(@stations[first_station_index], @stations[last_station_index])
      @routes << route
    end
  end
  def add_station_to_route
    puts "Выберите индекс маршрута"
    show_collection(@routes)
    route = @routes[gets.to_i]
    puts "Выберите индекс станции"
    show_collection(@stations)
    station = @stations[gets.to_i]
    route.add_station(station)
  end
  def remove_station_from_route
    puts "Выберите индекс маршрута"
    show_collection(@routes)
    route = @routes[gets.to_i]
    puts "Выберите индекс станции"
    show_collection(@stations)
    station = @stations[gets.to_i]
    route.del_station(station)
  end
  def show_route
    puts "Выберите индекс маршрута"
    @routes.each_with_index {|route, index| puts "#{index} - #{route}" }
    route = @routes[gets.to_i]
    route.stations.each_with_index { |station, index|  puts "#{index + 1}-я станция - #{station.title}" }
  end
  def route_list
    puts "Все маршруты"
    @routes.each do |route|
      puts route
      puts "Станции этого маршрута"
      route.stations.each_with_index { |station, index| puts "#{index + 1}-я станция #{station.title}" }
    end
  end
  # Trains
  def all_trains
    puts "Все поезда"
    @trains.each {|train| puts "#{train.number} - #{train}" }
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
  def describe_one_train
    puts "Выберите поезд по индексу"
    @trains.each_with_index {|train, index| puts "#{index} - #{train}" }
    train = @trains[gets.to_i]
    puts train
  end
  def set_route_to_train
    puts "Выберите поезд"
    show_collection(@trains)
    train = @trains[gets.to_i]
    puts "Выберите индекс маршрута"
    show_collection(@routes)
    route = @routes[gets.to_i]
    train.take_route(route)
  end
  def add_wagon_to_train
    puts "Выберите поезд по индексу"
    @trains.each_with_index {|train, index| puts "#{index} - #{train}" }
    train = @trains[gets.to_i]
    train.add_wagon
  end
  def remove_wagon_from_train
    puts "Выберите поезд по индексу"
    @trains.each_with_index {|train, index| puts "#{index} - #{train}" }
    train = @trains[gets.to_i]
    train.del_wagon
  end
  def move_train_forward
    puts "Выберите поезд по индексу"
    @trains.each_with_index {|train, index| puts "#{index} - #{train}" }
    train = @trains[gets.to_i]
    train.go_front
  end
  def move_train_backward
    puts "Выберите поезд по индексу"
    @trains.each_with_index {|train, index| puts "#{index} - #{train}" }
    train = @trains[gets.to_i]
    train.go_back
  end
  def show_trains_menu
    puts "Введите 1 для создания поезда"
    puts "Введите 2 чтобы увидеть список всех поездов"
    puts "Введите 3 чтобы рассмотреть конкретный поезд"
    puts "Введите 4 чтобы назначать маршрут поезду"
    puts "Введите 5 чтобы добавить вагоны к поезду"
    puts "Введите 6 чтобы отцепить вагоны от поезда"
    puts "Введите 7 чтобы переместить поезд по маршруту вперед"
    puts "Введите 8 чтобы переместить поезд по маршруту назад"
    puts "Введите 0 чтобы выйти в предыдущее меню"
  end
  def work_with_trains
    loop do
      show_trains_menu
      choice = gets.to_i
      break if choice == 0
      case choice
      when 1 then create_train
      when 2 then all_trains
      when 3 then describe_one_train
      when 4 then set_route_to_train
      when 5 then add_wagon_to_train
      when 6 then remove_wagon_from_train
      when 7 then move_train_forward
      when 8 then move_train_backward
      else puts "Я не знаю чего ты хочешь"
      end
    end
  end

  def show_collection(collection)
    collection.each_with_index do |item, index|
      puts "#{index} - #{item}"
    end
  end
  def show_main_menu
    puts "Введите что вы хотите сделать?"
    puts "1 - Поработать со станциями"
    puts "2 - Поработать с марщрутами"
    puts "3 - Поработать с поездами"
    puts "quit - завершить программу"
  end
  def error_index
    puts "Я не понял чего ты хочешь"
  end


end

ewq = Main.new
ewq.run

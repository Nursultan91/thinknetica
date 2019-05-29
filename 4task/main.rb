require_relative 'station'
require_relative 'route'
require './train/train.rb'
require './train/cargo_train.rb'
require './train/passenger_train.rb'
require './wagon/wagon.rb'
require './wagon/cargo_wagon.rb'
require './wagon/passenger_wagon.rb'

class Main
  attr_reader :stations, :routes, :trains


  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
  end
  def run
    loop do
      show_main_menu
      choice = gets.chomp
      # break if choice == "quit"
      case choice.to_i
      when 1 then work_with_stations
      when 2 then work_with_routes
      when 3 then work_with_trains
      when 4 then work_with_wagons
      when 0 then break
      else puts "Я не знаю чего ты хочешь"
      end
    end
  end

  private

  # Stations
  def work_with_stations
    loop do
      show_stations_menu
      choice = gets.to_i
      case choice
      when 1 then create_station
      when 2 then stations_list
      when 3 then describe_one_station
      when 0 then break
      else error_index
      end
    end
  end
  def show_stations_menu
    puts "Введите 1 для создания станции"
    puts "Введите 2 чтобы увидеть список всех станций"
    puts "Введите 3 чтобы рассмотреть конкретную станцию"
    puts "Введите 0 чтобы выйти в предыдущее меню"
  end
  def create_station
    puts "Введите название станции"
    name = gets.chomp
    station = Station.new(name)
    @stations << station
  end
  def stations_list
    @stations.to_enum.with_index(1).each { |station, index| puts "#{index}-я станция #{station.title}" }
  end
  def describe_one_station
    puts "Выберите номер станции"
    @stations.to_enum.with_index(1).each { |station, index| puts "#{index}-я станция #{station.title}" }
    station = @stations[gets.to_i - 1]
    puts station
    puts station.trains
  end
  # Routes
  def work_with_routes
    loop do
      show_routes_menu
      choice = gets.to_i
      case choice
      when 1 then create_route
      when 2 then route_list
      when 3 then show_route
      when 4 then add_station_to_route
      when 5 then remove_station_from_route
      when 0 then break
      else error_index
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
    loop do
      break if @stations.length >= 2
      puts "Для создания маршрута необходимо создать минимум две станции"
      create_station
    end
    puts "Введите номер первой станции выбрав ее из списка"
    @stations.to_enum.with_index(1).each { |station, index| puts "#{index}: #{station.title}" }
    first_station_index = gets.to_i - 1
    puts "Введите номер последней станции выбрав ее из списка"
    @stations.to_enum.with_index(1).each { |station, index| puts "#{index}: #{station.title}" }
    last_station_index = gets.to_i - 1
    route = Route.new(@stations[first_station_index], @stations[last_station_index])
    @routes << route
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
    show_collection(@routes)
    route = @routes[gets.to_i]
    route.stations.to_enum.with_index(1).each { |station, index| puts "#{index}-я станция #{station.title}" }
  end
  def route_list
    puts "Все маршруты"
    @routes.each do |route|
      puts route
      puts "Станции этого маршрута"
      route.stations.to_enum.with_index(1).each { |station, index| puts "#{index}-я станция #{station.title}" }
    end
  end
  # Trains
  def all_trains
    puts "Все поезда"
    @trains.each {|train| puts "#{train.number} - #{train}" }
  end
  def create_train
    puts "Выберите тип: 1 - грузовой, 2 - пассажирский"
    train_type_choice = gets.to_i
    if train_type_choice == 1
      create_cargo_train
    elsif train_type_choice == 2
      create_passenger_train
    else
      puts "Нет такого типа. Попробуйте еще раз"
    end
  end
  def create_passenger_train
    puts "Введите номер поезда"
    number = gets.to_i
    train = PassengerTrain.new(number)
    @trains << train
  end
  def create_cargo_train
    puts "Введите номер поезда"
    number = gets.to_i
    train = CargoTrain.new(number)
    @trains << train
  end
  def describe_one_train
    puts "Выберите поезд по индексу"
    show_collection(@trains)
    train = @trains[gets.to_i]
    puts "Номер объекта -#{train}"
    puts "Тип поезда - #{train.type}"
    puts "Номер Поезда - #{train.number}"
    if train.train_wagons == 0
      puts "Нет Вагонов"
    else
      puts "Количество вагонов - #{train.train_wagons}"
    end

    if train.route == nil
      puts "Поезд в Депо"
    else
      puts "Текущая станция - #{train.current_station.title}"
      puts "Маршрут - #{train.route}"
    end
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
    show_collection(@trains)
    train = @trains[gets.to_i]
    puts "Выберите вагон по индексу"
    show_collection(@wagons)
    wagon = @wagons[gets.to_i]
    train.add_wagon(wagon)
  end
  def remove_wagon_from_train
    puts "Выберите поезд по индексу"
    show_collection(@trains)
    train = @trains[gets.to_i]
    train.del_wagon
  end
  def move_train_forward
    puts "Выберите поезд по индексу"
    @trains.to_enum.with_index(1).each { |train, index| puts "#{index}: - #{train}" }
    train = @trains[gets.to_i - 1]
    train.go_front
  end
  def move_train_backward
    puts "Выберите поезд по индексу"
    @trains.to_enum.with_index(1).each { |train, index| puts "#{index}: - #{train}" }
    train = @trains[gets.to_i - 1]
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
      case choice
      when 1 then create_train
      when 2 then all_trains
      when 3 then describe_one_train
      when 4 then set_route_to_train
      when 5 then add_wagon_to_train
      when 6 then remove_wagon_from_train
      when 7 then move_train_forward
      when 8 then move_train_backward
      when 0 then break
      else error_index
      end
    end
  end
  # WAGONS
  def show_wagons_menu
    puts "Введите 1 для создания вагона"
    puts "Введите 2 чтобы увидеть список всех вагоноы"
    puts "Введите 3 чтобы рассмотреть конкретный вагон"
    puts "Введите 0 чтобы выйти в предыдущее меню"
  end
  def work_with_wagons
    loop do
      show_wagons_menu
      choice = gets.to_i
      case choice
      when 1 then create_wagon
      when 2 then all_wagons
      when 3 then describe_one_wagon
      when 0 then break
      else error_index
      end
    end
  end
  def create_wagon
    puts "Выберите тип: 1 - грузовой, 2 - пассажирский"
    train_type_choice = gets.to_i
    if train_type_choice == 1
      create_cargo_wagon
    elsif train_type_choice == 2
      create_passenger_wagon
    else
      puts "Нет такого типа. Попробуйте еще раз"
    end
  end
  def create_passenger_wagon
    wagon = PassengerWagon.new
    @wagons << wagon
  end
  def create_cargo_wagon
    wagon = CargoWagon.new
    @wagons << wagon
  end
  def all_wagons
    puts "Все вагоны"
    show_collection(@wagons)
  end
  def describe_one_wagon
    puts "Выберите вагон по индексу"
    show_collection(@wagons)
    wagon = @wagons[gets.to_i]
    puts "Номер объекта -#{wagon}"
    puts "Тип вагона - #{wagon.type}"
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
    puts "4 - Поработать с ванонами"
    puts "0 - завершить программу"
  end
  def error_index
    puts "Я не понял чего ты хочешь"
  end


end

ewq = Main.new
ewq.run

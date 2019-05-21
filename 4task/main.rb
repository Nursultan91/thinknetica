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
    # x.delete_at(x.index 2)
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

  def work_with_stations
    loop do
      puts "Введите 1 для создания станции"
      puts "Введите 2 чтобы увидеть список всех станций"
      puts "Введите 3 чтобы выйти в предыдущее меню"
      choice = gets.to_i
      break if choice == 3

      case choice
      when 1
        create_station
      when 2
        print "Начало маршрута - "
        @stations.each { |station| print station.title + " - " }
        puts " Конец маршрута"
      else
        puts "Я не понял чего ты хочешь"
      end
    end
  end

  def work_with_routes
    loop do
      puts "Введите 1 для создания маршрута"
      puts "Введите 2 чтобы увидеть список всех маршрутов"
      puts "Введите 3 чтобы рассмотреть конкретный маршрут"
      puts "Введите 4 чтобы добавить станцию к марщруту"
      puts "Введите 5 чтобы удалить станцию из марщрута"
      puts "Введите 6 чтобы выйти в предыдущее меню"
      choice = gets.to_i
      break if choice == 6

      case choice
      when 1
        # Создать маршрут
        if @stations.length < 2
          puts "Для создания маршрута необходимо создать минимум две станции"
          puts "Создать станцию - 1, предыдущее меню - нажмите любую клавишу"
          user_choice = gets.to_i
          if user_choice == 1
            create_station
          end
        else
          create_route
        end
      when 2
        # Посомтреть список всех маршрутов
        puts "Все маршруты"
        @routes.each { |route| puts route }
      when 3
        # Посмотреть конкретный маршрут
        puts "Выберите индекс маршрута"
        @routes.each_with_index {|route, index| puts "#{index} - #{route}" }
        route = @routes[gets.to_i]
        route.stations.each_with_index { |station, index|  puts "#{index + 1}-я станция - #{station.title}" }
      when 4
        # добавить станцию к марщруту
        puts "Выберите индекс маршрута"
        @routes.each_with_index {|route, index| puts "#{index} - #{route}" }
        route = @routes[gets.to_i]
        puts "Выберите индекс станции"
        @stations.each_with_index {|station, index| puts "#{index} - #{station}" }
        station = @stations[gets.to_i]
        route.add_station(station)
      when 5
        # удалить станцию из марщрута
        puts "Выберите индекс маршрута"
        @routes.each_with_index {|route, index| puts "#{index} - #{route}" }
        route = @routes[gets.to_i]
        puts "Выберите индекс станции"
        @stations.each_with_index {|station, index| puts "#{index} - #{station}" }
        station = @stations[gets.to_i]
        route.del_station(station)
      else
        puts "Я не понял чего ты хочешь"
      end
    end
  end

  def go
    loop do
      puts "Введите что вы хотите сделать?"
      puts "1 - Поработать со станциями"
      puts "2 - Поработать с марщрутами"
      puts "3 - Поработать с поездами"
      puts "quit - завершить программу"

      choice = gets.chomp
      break if choice == "quit"
      case choice.to_i
      when 1
        work_with_stations
      when 2
        work_with_routes
      when 3
        create_train
      else
        puts "Я не знаю чего ты хочешь"
      end
    end
  end
end

ewq = Main.new
ewq.go

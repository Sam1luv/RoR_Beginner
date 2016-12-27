require_relative 'manufacturer'
require_relative 'validation'
require_relative 'train'
require_relative 'carriage'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'route'
require_relative 'station'

class TrainProgram
  def initialize
    @station_list ||= []
    @trains_list ||= []
  end

  def main
    puts 'Вас приветствует система управления поездами и станциями'
    puts 'Выберите необходимый вариант меню'
    puts '1. Создать новую станцию'
    puts '2. Создать новый поезд'
    puts '3. Добавить вагон'
    puts '4. Отцепить вагон'
    puts '5. Поместить поезд на станцию'
    puts '6. Список станций'
    puts '7. Список поездов на станции'
    puts '8. Вывести список вагонов у поезда'
    puts '9. Занять места или заполнить объем в вагонах'
    puts '10. Вывести список поездов на станции'
    puts '0. Завершение работы'
    print '---------------------------------------------------------'
    input = gets.chomp.to_i
    loop do
      case input
      when 1
        create_new_station
      when 2
        create_new_train
      when 3
        add_carriage_by_type
      when 4
        remove_carriage
      when 5
        move_between_station
      when 6
        route_list
      when 7
        train_list
      when 8
        show_trains_carriage_list
      when 9
        fill_places_or_amount
      when 10
        show_trains_on_station
      when 0
        exit
      end
    end
  end

  private

  def create_new_station
    puts 'Введите название станции:'
    station_name = gets.chomp
    if @station_list.include?(station_name)
      puts 'Данная станция уже есть в маршруте'
    else
      @station_list << Station.new(station_name)
    end
    main
  end

  def create_new_train
    begin
      puts 'Введите номер поезда'
      train_number = gets.chomp
      puts 'Укажите необходимый типа поезда: пассажирский/грузовой'
      train_type = gets.chomp.downcase
      if train_type == 'пассажирский'
        @trains_list << CargoTrain.new(train_number)
        puts "Создан #{train_type} поезд с номером #{train_number}"
      elsif train_type == 'грузовой'
        @trains_list << PassengerTrain.new(train_number)
        puts "Создан #{train_type} поезд с номером #{train_number}"
      end
    rescue RuntimeError => e
      e.message
      retry
    end
    main
  end

  def add_carriage_by_type(train)
    puts 'Укажите необходимый типа вагона: пассажирский/грузовой'
    carriage_type = gets.chomp.downcase
    if carriage_type == 'пассажирский'
      carriage.type = :passenger
      puts 'Введите количество место в вагоне'
      total_places = gets.chomp.to_i
      train.carriage_list << PassengerCarriage.new(total_places)
      puts "Создан #{carriage_type} вагон с #{total_places} мест"
    elsif train_type == 'грузовой'
      carriage.type = :cargo
      puts 'Введите объем вагона'
      total_amount = gets.chomp.to_i
      train.carriage_list << CargoCarriage.new(total_amount)
      puts "Создан #{carriage_type} вагон с объемом #{total_amount}"
    end
  rescue RuntimeError => e
    e.message
    retry
  end

  def show_trains_carriage_list(train)
    carriage_number = 1
    train.carriage_list.each do |carriage|
      puts "Вагон №#{carriage_number}, типа - #{carriage.type}"
      puts "Занято: #{carriage.type == :passenger ? carriage.occupied_places : carriage.occupied_amount}"
      puts "Свободно: #{carriage.type == :passenger ? carriage.empty_places : carriage.empty_amount}"
      carriage_number += 1
    end
  end

  def fill_places_or_amount(carriage)
    if carriage.type == :cargo
      puts 'Укажите объем'
      amount = gets.chomp.to_i
      carriage.fill_volume!(amount)
    else
      carriage.add_places!
    end
  end

  def show_trains_on_station(station)
    station.train_list do |train|
      puts "Номер поезда:#{train.train_number}"
      puts "типа поезда:#{train.type}"
      puts "Количество вагонов :#{train.carriage_list.length}"
    end
  end
end

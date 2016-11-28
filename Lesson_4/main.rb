require_relative 'train'
require_relative 'carriage'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'route'
require_relative 'station'

class TrainProgram
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
    puts '8. Завершение работы'
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
        move_train_to_station
      when 6
        route_list
      when 7
        train_list
      when 8
        exit
      end
    end
  end

  private

  def create_new_station
    @station_list = []
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
    @trains_list = []
    puts 'Укажите необходимый типа поезда: пассажирский/грузовой'
    train_type = gets.chomp.downcase
    if train_type == 'пассажирский'
      @trains_list << CargoTrain.new(train_number)
    elsif train_type == 'грузовой'
      @trains_list << PassengerTrain.new(train_number)
    else
      puts 'Неверно указан типа поезда'
      create_new_train
    end
  end

  def add_carriage_by_type
    puts 'Укажите необходимый типа вагона: пассажирский/грузовой'
    carriage_type = gets.chomp.downcase
    if carriage_type == 'пассажирский'
      carriage.type = :passenger
    elsif train_type == 'грузовой'
      carriage.type = :cargo
    else
      puts 'Неверно указан типа поезда'
      add_carriage_by_type
    end
  end
end

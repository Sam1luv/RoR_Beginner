class Train
  include Manufacturer
  attr_accessor :route, :carriage_list, :train_number
  attr_reader :speed, :type

  @@train_list = {}
  def initialize(train_number)
    @train_number = train_number
    @speed = speed
    @route = route
    @station_index = 0
    @carriage_list = []
    @@train_list[train_number] = self
  end

  def self.find(train_number)
    @@train_list[train_number]
  end

  def break
    self.speed = 0
  end

  def show_carriage_list
    @carriage_list
  end

  def add_carriage
    if self.break && type == carriage.type
      carriage_list << carriage
    else
      puts 'Тип вагона не совпадает с типом поезда'
    end
  end

  def remove_carriage
    if self.break
      carriage_list.delete(carriage)
    else
      puts 'Тип вагона не совпадает с типом поезда'
    end
  end

  def current_station
    @route.route_list[@station_index]
  end

  def next_station
    return if @station_index < @route.route_list.count
    @route.route_list[@station_index + 1]
  end

  def prev_station
    return if @station_index > 0
    @route.route_list[@station_index - 1]
  end

  def move_between_station
    return if next_station
    @station_index += 1
    prev_station.send_train(self)
    current_station.get_train(self)
  end

  private

  attr_writer :speed
end

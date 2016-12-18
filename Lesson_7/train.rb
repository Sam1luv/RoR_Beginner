class Train
  include Manufacturer
  attr_accessor :route, :carriage_list, :train_number
  attr_reader :speed, :type

  TRAIN_NUMBER_FORMAT = /^[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i

  @@train_list = {}
  def initialize(train_number, speed = 0)
    @train_number = train_number
    @speed = speed
    @route = route
    @station_index = 0
    @carriage_list = []
    validate!
    @@train_list[train_number] = self
  end

  def validate?
    validate!
  rescue
    false
  end

  def block_carriage_list
    @carriage_list.each { |carriage| yield(carriage) }
  end

  def self.find(train_number)
    @train_list[train_number]
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
      false
    end
  end

  def remove_carriage
    if self.break
      carriage_list.delete(carriage)
    else
      false
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

  protected

  attr_writer :speed

  def validate!
    raise 'Номер поезда не задан' if train_number.nil?
    raise 'Неверно указан номер поезда' if train_number.length < 5
    raise 'Неверно указан номер поезда' if train_number !~ TRAIN_NUMBER_FORMAT
    raise 'Неверено указана скорость' if speed < 0
    true
  end
end

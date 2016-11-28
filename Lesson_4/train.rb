class Train
  attr_writer :train_number
  attr_accessor :route, :carriage_list
  attr_reader :speed, :type

  def initialize(train_number)
    @train_number = train_number
    @speed = speed
    @route = route
    @station_index = 0
    @carriage_list = []
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
    if self.break && type == carriage.type
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

class Train
  attr_writer :train_number, :type
  attr_accessor :speed, :route, :carriage_amount

  def initialize(train_number, type, carriage_amount)
    @train_number = train_number
    @type = type
    @carriage_amount = carriage_amount
    @speed = speed
    @route = route
    @station_index = 0
  end

  def current_speed
    @speed
  end

  def brake
    self.speed = 0
  end

  def show_carriage_amount
    @carriage_amount
  end

  def add_carriage
    @carriage_amount += 1 if speed.zero?
  end

  def remove_carriage
    @carriage_amount -= 1 if speed.zero? && @carriage_amount > 0
  end

  def current_station
    @route.route_list[@station_index]
  end

  def next_station
    if @station_index < @route.route_list.count
      @route.route_list[@station_index + 1]
    else
      brake
    end
  end

  def prev_station
    if @station_index > 0
      @route.route_list[@station_index - 1]
    else
      brake
    end
  end

  def move_between_station
    return if next_station
    @station_index += 1
    prev_station.send_train(self)
    current_station.get_train(self)
  end
end

class Train
  attr_writer :train_number, :type
  attr_accessor :speed, :route_list, :carriage_amount, :station_index


  def initialize(train_number, type, carriage_amount)
    @train_number = train_number
    @type = type
    @carriage_amount = carriage_amount
    @speed = speed
    @route_list = route_list
    @station_index = station_index
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
  @carriage_amount += 1 if speed == 0
end

def remove_carriage
  @carriage_amount -= 1 if speed  == 0
end

# Нужна помощь в решении следующих пунктов:

#Может перемещаться между станциями, указанными в маршруте.
#Показывать предыдущую станцию, текущую, следующую, на основе маршрута


def

end

class Route
  attr_writer :begin_station, :end_station
  attr_accessor :route_list

  ROUTE_STATION_FORMAT = /^[a-zа-я0-9]$/i

  def initialize(begin_station, end_station)
    @begin_station = begin_station
    @end_station = end_station
    @route_list = [@begin_station, @end_station]
    validate!
  end

  def validate?
    validate!
  rescue
    false
  end

  def add_way_station(way_station)
    @route_list.insert(-2, way_station)
  end

  def delete_way_station(way_station)
    @route_list.delete(way_station)
  end

  protected

  def validate!
    raise 'Начальная станция маршрута не указана' if begin_station.nil?
    raise 'Конечная станция маршрута не указана' if end_station.nil?
    raise 'Неверное название станции' if begin_station && end_station !~ ROUTE_STATION_FORMAT
    true
  end
end

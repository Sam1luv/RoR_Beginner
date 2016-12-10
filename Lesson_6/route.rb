class Route
  attr_writer :begin_station, :end_station
  attr_accessor :route_list

  def initialize(begin_station, end_station)
    @begin_station = begin_station
    @end_station = end_station
    validate!
    @route_list = [@begin_station, @end_station]
  end

  def validate?
    validate!
  rescue
    false
  end

  def add_way_station(way_station)
    add_way_station_validate!
    @route_list.insert(-2, way_station)
  end

  def delete_way_station(way_station)
    @route_list.delete(way_station)
  end

  protected

  def delete_way_station_validate!
    raise 'Промежуточная станция не указана' if way_station.nil?
    raise 'Данной станции нет в списке' if @route_list.exclude?(way_station)
    true
  end

  def add_way_station_validate!
    raise 'Промежуточная станция не указана' if way_station.nil?
    raise 'Введенные данные не могут быть промежуточной станцией' if way_station.class != Station
    true
  end

  def validate!
    raise 'Начальная станция не указана' if @begin_station.nil?
    raise 'Конечная станция не указана' if @end_station.nil?
    raise 'Введенные данные не могут быть начальной станцией' if @begin_station.class != Station
    raise 'Введенные данные не могут быть конечной станцией' if @end_station.class != Station
    true
  end
end

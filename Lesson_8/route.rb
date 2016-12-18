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
    raise 'Данной станция отсутствует' if @route_list.exclude?(way_station)
    true
  end

  def add_way_station_validate!
    raise 'Промежуточная станция не указана' if way_station.nil?
    raise 'Введенные данные неверны' if way_station.to_a? Station == false
    true
  end

  def validate!
    raise 'Начальная станция не указана' if @begin_station.nil?
    raise 'Конечная станция не указана' if @end_station.nil?
    raise 'Введенные данные неверны' if @begin_station.to_a? Station == false
    raise 'Введенные данные неверны' if @end_station.to_a? Station == false
    true
  end
end

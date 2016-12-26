class Route
  attr_writer :begin_station, :end_station
  attr_accessor :route_list

  def initialize(begin_station, end_station)
    @begin_station = begin_station
    @end_station = end_station
    @route_list = [@begin_station, @end_station]
  end

  def add_way_station(way_station)
    add_way_station_validate!
    @route_list.insert(-2, way_station)
  end

  def delete_way_station(way_station)
    @route_list.delete(way_station)
  end

end

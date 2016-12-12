class PassengerCarriage < Carriage
  attr_reader :car_capacity

  def initialize(car_capacity)
    @type = :passenger
    @car_capacity = car_capacity
  end

  def show_taken_places
    @car_capacity
  end

  def show_empty_places
    # code
  end

  protected

  attr_writer :car_capacity

  def add_place
    @car_capacity += 1
  end
end

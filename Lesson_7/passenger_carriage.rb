class PassengerCarriage < Carriage
  attr_reader :empty_places, :occupied_places

  def initialize(total_places)
    @type = :passenger
    @total_places = total_places
    @empty_places = total_places
    @occupied_places = 0
  end

  def show_occupied_places
    @occupied_places
  end

  def show_empty_places
    @empty_places
  end

  protected

  attr_writer :occupied_places, :empty_places

  def add_place!
    return if @occupied_places >= @total_places
    @occupied_places += 1
    @empty_places -= 1
  end
end

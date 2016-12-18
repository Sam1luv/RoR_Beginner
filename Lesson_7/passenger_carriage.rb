class PassengerCarriage < Carriage
  attr_reader :empty_places, :occupied_places

  def initialize(total_places)
    @type = :passenger
    validate!
    @total_places = total_places
    @empty_places = total_places
    @occupied_places = 0
  end

  protected

  def validate!
    raise 'Ошибка количества мест' if total_places.nil? && total_places < 0
  end

  attr_writer :occupied_places, :empty_places

  def add_place!
    return if @occupied_places >= @total_places
    @occupied_places += 1
    @empty_places -= 1
  end
end

class CargoCarriage < Carriage
  attr_reader :empty_amount, :occupied_amount

  def initialize(total_amount)
    @type = :cargo
    @total_amount = total_amount
    @empty_amount = total_amount
    @occupied_amount = 0
  end

  protected

  attr_writer :empty_amount, :occupied_amount

  def fill_volume!(amount)
    return if @occupied_amount >= @total_amount
    @occupied_amount += amount
    @empty_amount -= amount
  end
end

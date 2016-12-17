class CargoCarriage < Carriage
  attr_reader :empty_amount, :occupied_amount

  def initialize(total_amount)
    @type = :cargo
    validate!
    @total_amount = total_amount
    @empty_amount = total_amount
    @occupied_amount = 0
  end

  protected

  def validate!
    raise 'Общий объем указан неверно' if total_amount.nil? && total_amount < 0
  end

  attr_writer :empty_amount, :occupied_amount

  def fill_volume!(amount)
    return if @occupied_amount >= @total_amount
    @occupied_amount += amount
    @empty_amount -= amount
  end
end

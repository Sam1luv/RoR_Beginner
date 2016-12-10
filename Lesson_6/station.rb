class Station
  attr_writer :name
  attr_accessor :train_list

  STATION_NAME_FORMAT = /^[a-zа-я0-9]$/i

  @station_list = []
  def initialize(name)
    @name = name
    @train_list = []
    validate!
    @station_list << self
  end

  def validate?
    validate!
  rescue
    false
  end

  def self.all
    @@station_list
  end

  def get_train(train)
    @train_list << train
  end

  def show_train_list
    @train_list
  end

  def show_train_by_type(type)
    type_list = @train_list.count { |_x| train.type == type }
    puts "#{type_list} : #{type}"
  end

  def send_train(train)
    @train_list.delete(train) if @train_list.include?(train)
  end

  protected

  def validate!
    raise 'Название станции не указано' if name.nil?
    raise 'Неверный формат названия станции' if name !~ STATION_NAME_FORMAT
    true
  end
end

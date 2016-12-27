class Station
  include Validation
  attr_writer :name
  attr_accessor :train_list

  STATION_NAME_FORMAT = /^[a-zа-я0-9]$/i

  validate :name, :presence
  validate :name, :format, STATION_NAME_FORMAT
  validate :type, :type, Station

  @station_list = []
  def initialize(name)
    @name = name
    @train_list = []
    @type = self
    validate!
    @station_list << self
  end

  def block_train_list
    @train_list.each { |train| yield(train) }
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

end

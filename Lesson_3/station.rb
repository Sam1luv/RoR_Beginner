class Station
  attr_writer :name
  attr_accessor :train_list

  def initialize(name)
    @name = name
    @train_list = []
  end

  def get_train(train)
    @train_list << train
  end

  def show_train_list
    @train_list
  end

  def show_train_by_type(type)
    type_list = @train_list.count { |type| train.type == type }
    puts "#{type_list} : #{type}"
  end

  def send_train(train)
    @train_list.delete(train) if @train_list.include?(train)
  end
end

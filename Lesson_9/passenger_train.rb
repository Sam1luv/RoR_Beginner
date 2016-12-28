class PassengerTrain < Train

  TRAIN_NUMBER_FORMAT = /^[a-zа-я0-9]{3}-?[a-zа-я0-9]{2}$/i
  
  validate :train_number, :presence
  validate :train_number, :format, TRAIN_NUMBER_FORMAT


  def initialize(train_number)
    @type = :passenger
    super
  end
end

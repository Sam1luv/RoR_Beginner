class PassengerTrain < Train
  def initialize(train_number)
    super
    @type = :passenger
  end
end

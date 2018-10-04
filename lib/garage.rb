class Garage

  def initialize
    @bikes = []
  end

  def dock(broken_bikes)
    broken_bikes.each{ |bike| @bikes << bike}
  end

  def bikes
    @bikes
  end


end

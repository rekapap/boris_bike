# creating file for docking station class
require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    fail "no bikes" unless @bike
    @bike
  end

  def dock(bike)
    fail 'Full capacity' if @bike
    @bike = bike
  end
end

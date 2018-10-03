# creating file for docking station class
require_relative 'bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail "no bikes" if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Full capacity' if @bikes.length >= 20
    @bikes << bike
  end
end

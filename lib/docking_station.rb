require_relative 'bike'

# DockikngStation
class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
    @broken_bikes = []
  end

  def release_bike
    raise 'No bikes' if @bikes.empty?
    @bikes.pop
  end

  def dock(bike)
    raise 'Full capacity' if full?
    if bike.working?
      @bikes << bike
    else
      @broken_bikes << bike
    end
  end

  private

  def full?
    @bikes.length + @broken_bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty? && @broken_bikes.empty?
  end
end

# Garage
class Garage
  attr_reader :bikes
  def initialize
    @bikes = []
  end

  def dock(broken_bikes)
    broken_bikes.each{ |bike| @bikes << bike }
  end

  def release_bikes
    fixing_bikes
    @bikes
  end

  def fixing_bikes
    @bikes.each do |bike|
      @bikes << bike.working_status = true
    end
  end

end






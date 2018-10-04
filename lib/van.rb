# Van
class Van
  def deliver_bikes(bikes, garage)
    garage.dock(bikes)
  end

  def distribute(working_bikes, station)
    station.dock(working_bikes)
  end

end

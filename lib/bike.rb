
class Bike

DEFAULT_STATUS = true
attr_writer :working_status

  def initialize(status = DEFAULT_STATUS)
    @working_status = status
  end

  def working?
    @working_status
  end

end

class Business
  attr_accessor :location, :name

  def initialize(location, name)
    @location = location
    @name = name
  end

  def has_location?
    location
  end

  def has_name?
    name
  end

end
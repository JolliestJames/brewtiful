class Pub
  attr_accessor :tap_list

  def initialize(location, name)
    @tap_list = []
    @location = location
    @name = name
  end

  def has_empty_tap_list?
    @tap_list.empty?
  end

  def has_location?
    @location
  end

  def has_name?
    @name
  end

end
class Pub < Business
  attr_accessor :tap_list

  def initialize(location, name)
    @tap_list = []
    @location = location
    @name = name
  end

  def has_an_empty_tap_list?
    tap_list.empty?
  end

end
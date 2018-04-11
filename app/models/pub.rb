class Pub
  attr_accessor :tap_list

  def initialize()
    @tap_list = []
  end

  def has_empty_tap_list?
    @tap_list.empty?
  end
  
end
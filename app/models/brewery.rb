class Brewery < Business
  attr_accessor :brews

  def initialize(location, name)
    @brews = []
    @location = location
    @name = name
  end

  def out_of_stock?
    brews.empty?
  end

end
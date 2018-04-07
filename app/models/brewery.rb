class Brewery
  attr_accessor :brews

  def initialize
    @brews = []
  end

  def out_of_stock?
    brews.empty?
  end
end
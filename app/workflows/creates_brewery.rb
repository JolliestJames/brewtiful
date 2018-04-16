class CreatesBrewery
  attr_accessor :name, :location, :brewery

  def initialize(name: " ", location: " ")
    @name = name
    @location = location
  end

  def build
    self.brewery = Brewery.new(name: name, location: location)
    brewery
  end

  def create
    build
    brewery.save
  end

end
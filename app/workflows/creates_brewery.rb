class CreatesBrewery
  attr_accessor :name, :location, :brewery

  def initialize(name: " ", location: " ")
    @name = name
    @location = location
    @success = false
  end

  def success?
    @success
  end

  def build
    self.brewery = Brewery.new(name: name, location: location)
    brewery
  end

  def create
    build
    result = brewery.save
    @success = result
  end

end
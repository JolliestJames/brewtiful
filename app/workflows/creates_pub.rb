class CreatesPub
  attr_accessor :name, :location, :pub

  def initialize(name: " ", location: " ")
    @name = name
    @location = location
    @success = false
  end

  def success?
    @success
  end

  def build
    self.pub = Pub.new(name: name, location: location)
    pub
  end

  def create
    build
    result = pub.save
    @success = result
  end
end
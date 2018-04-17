class CreatesPub
  attr_accessor :name, :location, :brews

  def initialize(name: "", location: "")
    @name = name
    @location = location
  end

  def build
    self.pub = Pub.new(name: name, location: location)
    pub
  end

  def create
    build
    pub.save
  end
end
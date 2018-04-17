class CreatesPub
  attr_accessor :name, :location, :pub

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
class Brewery
  attr_accessor :brews, :location, :name

  def initialize(location, name)
    @brews = []
    @location = location
    @name = name
  end

  def has_location?
    unless location.nil?
      return true
    end
    false 
  end

  def has_name?
    unless name.nil?
      return true
    end
    false 
  end

  def out_of_stock?
    brews.empty?
  end
  
end
class Business < ApplicationRecord
  self.abstract_class = true
  attr_accessor :location, :name

  def initialize(location, name)
    @location = location
    @name = name
  end

end
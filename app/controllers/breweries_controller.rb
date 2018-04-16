class BreweriesController < ApplicationController
  def new
    @brewery = Brewery.new
  end
end

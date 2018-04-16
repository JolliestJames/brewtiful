class BreweriesController < ApplicationController
  def new
    @brewery = Brewery.new
  end

  def index
    @breweries = Brewery.all
  end

  def create
    @workflow = CreatesBrewery.new(
      name: params[:brewery][:name],
      location: params[:brewery][:location])
    @workflow.create
    redirect_to breweries_path
  end
end

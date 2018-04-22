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
    if @workflow.success?
      redirect_to breweries_path
    else
      @brewery = @workflow.brewery
      render :new
    end
  end
  
end

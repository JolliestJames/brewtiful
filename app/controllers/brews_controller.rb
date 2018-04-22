class BrewsController < ApplicationController
  
  def new
    @brew = Brew.new
  end

  def index
    @brews = Brew.all
  end

  def create
    @workflow = CreatesBrew.new(
      name: params[:brew][:name],
      abv: params[:brew][:abv],
      ibus: params[:brew][:ibus],
      classification: params[:brew][:classification])
    @workflow.create
    if @workflow.success?
      redirect_to brews_path
    else
      @brew = @workflow.brew
      render :new
    end
  end

end

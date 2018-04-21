class BrewsController < ApplicationController
  
  def new
    @brew = Brew.new
  end

  def index
    @brews = Brew.all
  end

  def create

  end

end

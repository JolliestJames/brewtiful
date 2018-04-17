class PubsController < ApplicationController

  def index
    @pubs = Pub.all
  end

  def new
    @pub = Pub.new
  end

  def create
    @pub = Pub.new(name: params[:pub][:name], location: params[:pub][:location])
    @pub.save
    redirect_to pubs_path
  end

end

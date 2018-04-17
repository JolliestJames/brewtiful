class PubsController < ApplicationController

  def index
    @pubs = Pub.all
  end

  def new
    @pub = Pub.new
  end

  def create
    # @pub = Pub.new(name: params[:pub][:name], location: params[:pub][:location])
    # @pub.save
    # redirect_to pubs_path
    @workflow = CreatesPub.new(
      name: params[:pub][:name],
      location: params[:pub][:location])
    @workflow.create
    if @workflow.success?
      redirect_to pubs_path
    else
      @pub = @workflow.pub
      render :new
    end
  end

end
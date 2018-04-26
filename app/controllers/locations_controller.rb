class LocationsController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search].present?
      @locations = current_user.locations.near(params[:search], 50, :order => :distance)
    else
      @locations = current_user.locations.all
    end
  end

  def show
    @location = current_user.locations.find(params[:id])
  end

  def new
    @location = current_user.locations.new
  end

  def create
    @location = current_user.locations.new(allowed_params)
    if @location.save
      redirect_to @location, :notice => "Successfully created location."
    else
      render :new
    end
  end

  def edit
    @location = current_user.locations.find(params[:id])
  end

  def update
    @location = current_user.locations.find(params[:id])
    if @location.update_attributes(allowed_params)
      redirect_to @location, :notice  => "Successfully updated location."
    else
      render :edit
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_url, :notice => "Successfully destroyed location."
  end

  private

  def allowed_params
    params.require(:location).permit(:id, :address, :latitude, :longitude, :user_id)
  end
end
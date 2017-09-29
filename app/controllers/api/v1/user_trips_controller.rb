class Api::V1::UserTripsController < ApplicationController

  def withuserid
    @trips = UserTrip.where(user_id: params[:id])
    render json: @trips
  end

  def create
    @trip = UserTrip.new(name: params[:name], user_id: params[:user_id])
    if @trip.save
      render json: @trip
    end
  end

  def newlocation
    byebug
  end

end

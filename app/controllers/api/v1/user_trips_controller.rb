class Api::V1::UserTripsController < ApplicationController



  def create
    @trip = UserTrip.new(name: params[:name], user_id: params[:user_id])
    if @trip.save
      render json: @trip
    end
  end


end

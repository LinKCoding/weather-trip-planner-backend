class Api::V1::UserTripsController < ApplicationController

  def withuserid
    @trips = UserTrip.where(user_id: params[:id])
    render json: @trips
  end

  def create
    @trip = UserTrip.new(name: params[:name], user_id: params[:user_id])
    @new_location = Location.new(name: params[:newLocation])
    @new_location.start_date = params[:newTripStart].to_date
    @new_location.end_date = params[:newTripEnd].to_date
    @trip.locations << @new_location
    if @trip.save && @new_location.save
      render json: @trip
    end
  end

  def newlocation
    byebug
  end

  def forecast
    @trip = UserTrip.find_by(id: params[:trip_id])
    @forecastmap = @trip.locations.map do |location|
      location.forecast
    end
    render json: @forecastmap
  end

  def update
    @trip = UserTrip.find_by(id: params[:id])
    counter = 0
    @trip.locations.each do |location|
      byebug
      location.update({name: params[:locations][counter].split("||")[0], start_date: params[:locations][counter].split("||")[1], end_date: params[:locations][counter].split("||")[2]})
      counter++
    end
    render json: {status: "successful"}
  end

  def destroy
    @trip = UserTrip.find_by(id: params[:id])
    if @trip
      @trip.locations.each{|location| location.destroy }
      @trip.destroy
      render json: { status: "successful"}
    end
  end

end

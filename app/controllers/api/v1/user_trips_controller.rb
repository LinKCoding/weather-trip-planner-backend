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

  def newlocation(new_location_info)
    new_location = Location.new({name: new_location_info[0], start_date: new_location_info[1], end_date: new_location_info[2]})

    if new_location.save
      @trip.locations << new_location
    end
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
      location.update({name: params[:locations][counter].split("||")[0], start_date: params[:locations][counter].split("||")[1], end_date: params[:locations][counter].split("||")[2]})
      counter += 1
    end

    new_location_info = params[:newlocation].split("||")
    newlocation(new_location_info)

    render json: @trip
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

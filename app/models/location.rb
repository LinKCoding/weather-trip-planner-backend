
class Location < ApplicationRecord
  has_many :trip_locations
  has_many :user_trips, through: :trip_locations

  validates :name, :start_date, :end_date, presence: true



  def forecast
    response = RestClient::Request.execute(
    method: :get,
    url: "http://api.apixu.com/v1/forecast.json?key=ae905cf9d9d045aca71140334172909&q=#{self.name}&days=10"
    )
    resp = JSON.parse(response)
    arr = resp["forecast"]["forecastday"].map do |kennyday|
      kennyday["day"]
    end
    # resp["forecast"]["forecastday"][0]["day"]["condition"]["icon"]
  end

end

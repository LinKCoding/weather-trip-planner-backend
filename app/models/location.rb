class Location < ApplicationRecord
  has_many :trip_locations
  has_many :user_trips, through: :trip_locations
end

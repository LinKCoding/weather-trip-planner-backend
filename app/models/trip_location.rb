class TripLocation < ApplicationRecord
  belongs_to :user_trip
  belongs_to :location
end

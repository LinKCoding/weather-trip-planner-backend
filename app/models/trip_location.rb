class TripLocation < ApplicationRecord
  belongs_to :user_trip
  has_many :locations
end

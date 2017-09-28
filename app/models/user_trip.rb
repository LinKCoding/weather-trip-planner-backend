class UserTrip < ApplicationRecord
  belongs_to :user
  has_many :trip_locations
  has_many :locations, through: :trip_locations
end

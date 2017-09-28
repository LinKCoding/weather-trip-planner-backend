class User < ApplicationRecord
  has_secure_password
  has_many :user_trips
  has_many :trip_locations, through: :user_trips
  has_many :locations, through: :trip_locations

end

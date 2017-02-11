class Ride < ApplicationRecord
  belongs_to :driver, class_name: :User
  has_many :passenger_rides
  has_many :passengers, through: :passenger_rides
end

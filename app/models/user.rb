class User < ApplicationRecord
  has_many :driver_details, foreign_key: :driver_id
  has_many :sent_invitations, foreign_key: :driver_id, class_name: :Invitation
  has_many :received_invitations, foreign_key: :new_driver_id, class_name: :Invitation
  has_many :driver_rides, class_name: :Ride, foreign_key: :driver_id
  has_many :passenger_rides, foreign_key: :passenger_id
  has_many :rides, through: :passenger_rides
end

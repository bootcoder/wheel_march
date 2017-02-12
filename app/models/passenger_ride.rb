class PassengerRide < ApplicationRecord
  belongs_to :passenger, class_name: :User
  belongs_to :ride

  def channel_name
    "channel_#{passenger.id}_#{ride_id}"
  end

end

class Ride < ApplicationRecord
  belongs_to :driver, class_name: :User, dependent: :destroy
  has_many :passenger_rides
  has_many :passengers, through: :passenger_rides

  def add_passenger(new_passenger)
    if !self.is_full?
      self.passengers << new_passenger
      true
    else
      false
    end
  end

  def is_full?
     self.passengers.count == self.max_seats ? true : nil
  end
end

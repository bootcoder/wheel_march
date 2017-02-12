class PassengerRidesController < ApplicationController

  def subscribe
  end

  def publish
    p = passenger_rides_params
    @channel_name = PassengerRide.find(p[:id]).channel_name
    PubnubAdapter.publish(p[:message], @channel_name)
  end

private

  def passenger_rides_params
    params.require(:passenger_ride).permit(:id, :message)
  end

end

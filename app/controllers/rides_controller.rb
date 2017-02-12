class RidesController < ApplicationController
  def index
    @rides = Ride.all
    respond_to do |format|
      format.html
      format.json { render json: @rides }
    end
  end

  def new
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)

    if @ride.save
      respond_to do |format|
        format.html { redirect_to ride_path(@ride) }
        format.json { render json: @ride }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @ride.errors, status: :unprocessable_entity}
      end
    end

  end

  def show
    @ride = Ride.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @ride }
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def ride_params
      params.require(:ride).permit(:max_seats, :max_range, :start_point, :end_point, :start_time, :driver_id)
    end
end

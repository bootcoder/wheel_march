class DriverDetailsController < ApplicationController
  before_action :set_driver_detail, only: [:show, :edit, :update, :destroy]

  def index
    @driver_details = DriverDetail.all
    respond_to do |format|
      format.html
      format.json { render json: @driver_details }
    end
  end

  def new
    @driver_detail = DriverDetail.new
    @user = User.find(1) #stand in for current user
  end

  def create
    @driver_detail = DriverDetail.new(driver_detail_params)

    if @driver_detail.save
      respond_to do |format|
        format.html { redirect_to user_driver_detail_path(@driver_detail.driver.id,
                                                          @driver_detail) }
        format.json { render json: @driver_detail }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @driver_detail,
                             status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @driver_detail }
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def set_driver_detail
      @driver_detail = DriverDetail.find(params[:id])
    end

    def driver_detail_params
      params.require(:driver_detail).permit(:make,
                                            :model,
                                            :tag,
                                            :driver_id)
    end
end

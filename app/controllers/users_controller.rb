class UsersController < ApplicationController

  include SessionsHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if user_params[:password] == user_params[:password_confirmation]
        if @user.save
          session[:id] = @user.id
          format.html { redirect_to @user, notice: 'User successfully created.' }
          format.json { render json: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, notice: 'Passwords must match.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render json: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to rides_path, notice: 'User successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    redirect_to new_session_path unless @user.id == current_user.id
  end

  def user_params
    params.require(:user).permit(:username,
                                 :first_name,
                                 :last_name,
                                 :phone,
                                 :zip,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end

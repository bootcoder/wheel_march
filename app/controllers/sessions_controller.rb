class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:id] = @user.id
      respond_to do |format|
        format.html { redirect_to @user }
        format.json { render json: @user }
      end
    else
      respond_to do |format|
        format.html { render :new, notice: 'Username or Password incorrect' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    session[:id] = nil
    respond_to do |format|
      format.html { redirect_to rides_path }
      format.json { head :no_content }
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

end

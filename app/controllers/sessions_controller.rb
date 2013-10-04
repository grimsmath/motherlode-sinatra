class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:login][:username])

    if user && user.authenticate(session_params[:password])
      session[:username] = user.username
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid username or password!'
      render 'new'
    end
  end

  def destroy
    session[:username] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  #def set_user
  #  @user = User.find(params[:id])
  #end

  # Never trust parameters from the scary internet, only allow the white list through.
  def session_params
    params.require(:login).permit(:username, :password)
  end
end

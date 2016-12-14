class SessionsController < ApplicationController
  def index
  end
  def new
  end
  def login
    if User.find_by_email(params[:Email]).nil?
      flash[:noemail] = "Email does not exist"
      render "/sessions/new"
    end
    @user = User.find_by_email(params[:Email])
    if @user.authenticate(params[:Password]) == false
      flash[:error] = "Invalid"
      render "/sessions/new"
    else
      session[:user_id] = @user.id
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def logout
    reset_session
    redirect_to "/sessions/new"
  end
end

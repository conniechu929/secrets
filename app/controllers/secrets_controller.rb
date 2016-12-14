class SecretsController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]

  def index
    @secrets = Secret.all
    @like = Like.find_by_id(session[:user_id])
  end
  def new
  end
  def create
    if params[:secret].to_s == ''
      flash[:nosecret] = "No secret saved"
      redirect_to "/users/#{session[:user_id]}"
    else
      if session[:user_id].nil?
        redirect_to '/sessions/new'
      else
      @secret = Secret.create(content:params[:secret], user_id:session[:user_id])
      redirect_to "/users/#{session[:user_id]}"
      end
    end
  end

  def destroy
    secret = Secret.find(params[:id])
    secret.destroy if secret.user == current_user
    redirect_to "/users/#{current_user.id}"
  end

end

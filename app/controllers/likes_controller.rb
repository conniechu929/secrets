class LikesController < ApplicationController
  before_action :require_login, only: [:index, :create, :destroy]
  
  def index
  end
  def create
    @like = Like.create(secret_id:params[:secret_id], user_id: session[:user_id])
    redirect_to request.referer
  end

  def destroy
    like = Like.find_by_user_id_and_secret_id(session[:user_id], params[:secret_id])
    like.destroy
    redirect_to request.referer
  end
end


# def createlike
#   @like = Like.create(secret_id:params[:secret_id], user_id: session[:user_id])
#   redirect_to "/users/#{session[:user_id]}"
# end
# def destroy
#   like = Like.find_by_user_id_and_secret_id(session[:user_id], params[:secret_id])
#   like.destroy
#   redirect_to "/users/#{session[:user_id]}"
# end

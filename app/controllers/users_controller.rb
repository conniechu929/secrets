class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.new
  end
  def new
  end

  def create
    if params[:Name].to_s == '' || params[:Email].to_s == '' || params[:Password].to_s == '' || params[:Password_Confirmation].to_s == ''
      flash[:create_error] = "can't be blank"
      if params[:Password].to_s == "" && params[:Password_Confirmation].to_s == ""
        flash[:error] = "invalid"
        redirect_to "/users/new"
      end
    else
      if params[:Password] == params[:Password_Confirmation]
          @user = User.create(name:params[:Name], email:params[:Email], password:params[:Password])
          session[:user_id] = @user.id
          redirect_to "/users/#{session[:user_id]}"
        end
    end
  end

  def show
    @user = User.find(session[:user_id])
    @secrets = Secret.where(:user_id => session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update(name:params[:Name], email:params[:Email])
      redirect_to "/users/#{session[:user_id]}"
    else
      redirect_to "/users/#{session[:user_id]}/edit"
    end
  end

  def destroy
    @user = User.find_by_id(session[:user_id])
    @user.destroy
    reset_session
    redirect_to '/sessions/new'
  end


end

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "welcome"
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :avatar
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "controller.user.login_user"
      redirect_to login_url
    end
  end
end

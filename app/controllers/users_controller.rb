class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]

  before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.paginate page: params[:page]
  end

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

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = t "controller.user.message_success_update"
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email,
      :password, :password_confirmation, :avatar
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user? @user
  end
end

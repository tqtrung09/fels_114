class Admin::UsersController < Admin::ActionBaseController

  def index
    @users = User.paginate page: params[:page]
  end

  def destroy
    @user = User.find_by id: params[:id]
    @user.destroy unless current_user? @user
    redirect_to admin_users_path
  end
end

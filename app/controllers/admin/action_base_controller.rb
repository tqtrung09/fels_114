class Admin::ActionBaseController < ApplicationController
  before_action :logged_in?, :correct_admin

  private
  def correct_admin
    unless current_user.admin?
      flash[:danger] = t "not_admin"
      redirect_to login_path
    end
  end
end

class CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
    @category = Category.find_by id: params[:id]
    redirect_to root_path unless @user
  end
end

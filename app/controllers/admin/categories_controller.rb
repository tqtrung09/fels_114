class Admin::CategoriesController < Admin::ActionBaseController

  def index
    @categories = Category.paginate page: params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "controller.category.congratulations"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find_by id: params[:id]
  end

  def update
    @category = Category.find_by id: params[:id]
    if @category.update_attributes category_params
      flash[:success] = t "controller.user.message_success_update"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def show
    @category = Category.find_by id: params[:id]
    redirect_to admin_root_path unless @user
  end

  def destroy
    Category.find_by(id: params[:id]).destroy
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name, :content
  end
end

class Admin::CategoriesController < Admin::ActionBaseController
  before_action :load_category, only: [:show, :edit, :update]

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

  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "controller.user.message_success_update"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def show
    @word = @category.words.new
    Settings.number_answers.times{answers = @word.answers.build}
    @words = @category.words.paginate page: params[:page]
  end

  def destroy
    Category.find_by(id: params[:id]).destroy
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name, :content
  end

  def load_category
    @category = Category.find_by id: params[:id]
  end
end

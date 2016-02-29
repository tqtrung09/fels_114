class Admin::WordsController < Admin::ActionBaseController
  before_action :load_category, only: [:create, :update]

  def new
  end

  def create
    @word = @category.words.new word_params
    if @word.save
      flash[:success] = t "controller.word.created"
      redirect_to admin_category_path @category
    else
      redirect_to admin_category_path @category
    end
  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end

  private
  def load_category
    @category = Category.find_by id: params[:word][:category_id]
  end

  def word_params
    params.require(:word).permit(:category_id ,:content, :sound,
      answers_attributes: [:id, :content, :correct, :_destroy])
  end
end

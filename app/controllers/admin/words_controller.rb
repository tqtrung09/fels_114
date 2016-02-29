class Admin::WordsController < Admin::ActionBaseController
  before_action :load_category, only: [:create, :update]
  before_action :load_word, only: [:edit, :destroy, :update]

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
    if @word.update_attributes word_params
      flash[:success] = t "controller.word.updated"
      redirect_to admin_category_path @category
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    redirect_to admin_category_path @word.category
  end

  private
  def load_category
    @category = Category.find_by id: params[:word][:category_id]
  end

  def word_params
    params.require(:word).permit(:category_id ,:content, :sound,
      answers_attributes: [:id, :content, :correct, :_destroy])
  end

  def load_word
    @word = Word.find_by id: params[:id]
  end
end

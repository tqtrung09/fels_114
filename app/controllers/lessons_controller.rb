class LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :load_category, only: [:create]

  def create
    @lesson = current_user.lessons.new category_id: @category.id
    if @lesson.save
      flash[:success] = t "controller.lesson.message_success_create"
      redirect_to @lesson
    else
      redirect_to categories_path
    end
  end

  def show
    @lesson = Lesson.find_by id: params[:id]
    @true_answers = @lesson.lesson_words.true_answers
  end

  def update
    @lesson = Lesson.find_by id: params[:id]
    if @lesson.update_attributes lesson_params
      flash[:success] = t "lesson.complete"
    else
      flash[:danger] = t "lesson.fail"
    end
    redirect_to @lesson
  end

  private
  def load_category
    @category = Category.find_by id: params[:lesson][:category_id]
    redirect_to categories_path unless @category
  end

  def lesson_params
    params.require(:lesson).permit :result,
      lesson_words_attributes: [:id, :answer_id]
  end
end

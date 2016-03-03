class WordsController < ApplicationController
  before_action :logged_in_user, only: [:index]

  def index
    @categories = Category.all
    @words = if params[:category_id].blank?
      Word.send (params[:option] ||= "all_words"), current_user.id
    else
      @category = Category.find_by id: params[:category_id]
      @category.words.send (params[:option] ||= "all_words"), current_user.id
    end
    @words = @words.paginate page: params[:page]
  end
end

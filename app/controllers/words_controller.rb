class WordsController < ApplicationController

  def index
    @categories = Category.all
    @words = Word.paginate page: params[:page]
  end
end

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = current_user.activity.
        paginate page: params[:page]
    end
  end

  def help
  end

  def about

  end

  def contact
  end
end

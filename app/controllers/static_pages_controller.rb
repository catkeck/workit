class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @feed_items = []
    end
  end

  def about
  end
  
  def help
  end

  def contact_us
  end

  def login
  end
end

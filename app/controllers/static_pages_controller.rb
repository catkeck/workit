class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
      @user = current_user.id
      @microposts = current_user.microposts.paginate(page: params[:page])
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

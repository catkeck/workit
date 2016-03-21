class StaticPagesController < ApplicationController
  def home
    @home_page = true
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
      @user = current_user
      @weights = Weight.where(user_id: @user.id)
      @weight = @weights.order("created_at").last
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

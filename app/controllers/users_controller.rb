class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    if logged_in?
      @users = User.where(activated: true).paginate(page: params[:page]).order("name")
      if params[:search]
        @users = User.where(activated: true).search(params[:search]).order("name").paginate(page: params[:page]).order("name")
      else
        @users = User.where(activated: true).paginate(page: params[:page]).order("name")
      end
    else
      redirect_to login_url
    end
  end

  def friends
    @users = current_user.friends.paginate(page: params[:page]).order("name")
  end
  
  def show
    if logged_in?
      @user = User.find(params[:id])
      @micropost = current_user.microposts.build if logged_in?
      @microposts = Micropost.where(friend_id: @user.id).paginate(page: params[:page])
      redirect_to login_url and return unless @user.activated?
      @weights = Weight.where(user_id: @user.id)
      @weight = @weights.order("created_at").last
      @foods = Food.where(user_id: @user.id).where(date: Date.current.to_s)
      @total_calories = @foods.inject(0){|total,food| total + food.servings*food.calories}
    else
      redirect_to login_url
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Congratulations! You have created your account. Please check your email to activate it"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to login_url
    end
  end

  def update
    if logged_in?
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        render 'edit'
      end
    else
      redirect_to login_url
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to login_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #confirms if user is logged in
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end

    #Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
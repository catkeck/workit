class WeightsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :update, :edit, :show]
  before_action :correct_user, only: [:destroy]

  def new
    @weight = Weight.new
  end

  def create
    @weight = current_user.weights.build(weight_params)
    if @weight.save
      flash[:success] = "Weight added!"
      redirect_to current_user
    else
      flash[:notice] = "Can not add weight"
      redirect_to current_user
    end
  end

  def update
    @weight = current_user.weights.order("created_at").last
    if @weight.update_attributes(weight_params)
      flash[:success] = "Weight updated"
      redirect_to current_user
    else
      flash[:notice] = "Can not update weight"
      redirect_to current_user
    end
  end

  def edit
    @weight = Weight.find(params[:id])
  end

  def roll
    Users.each { |user|
      @weights = Weight.where(user_id: user)
      @weight = @weights.order("created_at").last
      if @weight.present?
        Weight.new(weight: @weight.weight, date: Date.yesterday, user_id: user.id)
      end
    }
  end

  def show
    @weight = current_user.weights.order("created_at").last
  end

  private

    def weight_params
      params.require(:weight).permit(:weight, :date, :user_id)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    #confirms if user is logged in
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end
end



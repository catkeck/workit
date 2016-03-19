class WeightsController < ApplicationController
  before_action :correct_user, only: [:create, :update]

  def create
    @weight = current_user.weights.build(weight_params)
    if @current_weight.save
      flash[:success] = "Weight added!"
    end 
    redirect_to current_user
  end

  def update
    @weight = Weight.find(params[:id])
    if @weight.update_attributes(weight_params)
      flash[:success] = "Weight updated"
    end
    redirect_to current_user
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
    @weight = Weight.order("created_at").last
  end

  private

    def weight_params
      params.require(weight)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end


end



class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]


  def index
    @foods = Food.all
  end

  def new
    query = params[:query]
    @food = Food.new
    @results = @food.search_api_for(query)
    render :new
  end

  def edit
  end

  def create
    @food = Food.new(food_params)
    @food.save
    if @food.save
      flash[:info] = "Congratulations! You have added this to your daily logged food"
      render :new
    else
      flash[:info] = "Sorry, but an error has taken place. This has not been added to your daily logged food. Please try with a different food!"
      redirect_to root_url
    end
  end

  def update
    @food.update(food_params)
    if @food.update
      flash[:info] = "Congratulations! Your food has been edited."
      redirect_to food_path
    else
      flash[:info] = "Sorry, but an error has taken place. This food has not been edited. Please try again later."
      redirect_to food_path
    end
  end

  def destroy
    @food.destroy
    redirect_to food_path
  end

  private

    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:brand_name, :item_id, :item_name, :user_id, :date, :servings, :description, :ingredients, :calories, :calories_from_fat, :total_fat, :saturated_fat, :cholesterol, :sodium, :carbohydrates, :dietary_fiber, :sugars, :protein, :vitamin_a, :vitamin_c, :calcium, :iron, :potassium, :serving_size, :serving_unit)
    end


end

    
class Food < ActiveRecord::Base
  belongs_to :user
  validates :item_name, presence: true
  validates :calories, presence: true
  validates :serving_size, presence: true
  require "nutritionix/api_1_1"

  def provider
    app_id = ENV["pusher_app_id"]
    app_key = ENV["pusher_key"]
    Nutritionix::Api_1_1.new(app_id, app_key)
  end

  def search_api_for(query)
    search_params = {
      limit: 1000,
      fields: ['item_name', 'brand_name', 'brand_id', 'item_id', 'item_description', 'nf_ingredient_statement', 'nf_calories', 'nf_calories_from_fat', 'nf_total_fat', 'nf_saturated_fat', 'nf_cholesterol', 'nf_sodium', 'nf_total_carbohydrate', 'nf_dietary_fiber', 'nf_sugars', 'nf_protein', 'nf_vitamin_a_dv', 'nf_vitamin_c_dv', 'nf_calcium_dv', 'nf_iron_dv', 'nf_potassium', 'nf_serving_size_qty', 'nf_serving_size_weight_unit'],
      query: query
    }

    results_json = provider.nxql_search(search_params)
    results = JSON.parse(results_json)
    results.fetch("hits") if results.key?("hits")
  end


end

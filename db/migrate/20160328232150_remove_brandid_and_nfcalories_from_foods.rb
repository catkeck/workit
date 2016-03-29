class RemoveBrandidAndNfcaloriesFromFoods < ActiveRecord::Migration
  def change
    remove_column :foods, :brand_id, :string
    remove_column :foods, :nf_calories, :float
  end
end

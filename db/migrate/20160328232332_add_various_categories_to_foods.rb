class AddVariousCategoriesToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :description, :text
    add_column :foods, :ingredients, :text
    add_column :foods, :calories, :integer
    add_column :foods, :calories_from_fat, :integer
    add_column :foods, :total_fat, :integer
    add_column :foods, :saturated_fat, :integer
    add_column :foods, :cholesterol, :integer
    add_column :foods, :sodium, :integer
    add_column :foods, :carbohydrates, :integer
    add_column :foods, :dietary_fiber, :integer
    add_column :foods, :sugars, :integer
    add_column :foods, :protein, :integer
    add_column :foods, :vitamin_a, :integer
    add_column :foods, :vitamin_c, :integer
    add_column :foods, :calcium, :integer
    add_column :foods, :iron, :integer
    add_column :foods, :potassium, :integer
    add_column :foods, :serving_size, :integer
    add_column :foods, :serving_unit, :string
  end
end

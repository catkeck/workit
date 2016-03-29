class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :brand_id
      t.string :brand_name
      t.integer :item_id
      t.string :item_name
      t.float :nf_calories
      t.integer :user_id
      t.datetime :date
      t.float :servings

      t.timestamps null: false
    end
  end
end

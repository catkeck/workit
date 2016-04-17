class ChangeDateInFoodsToBeInteger < ActiveRecord::Migration
  def change
    change_column :foods, :date, :integer
  end
end

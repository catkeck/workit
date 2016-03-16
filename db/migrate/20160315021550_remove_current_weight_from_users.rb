class RemoveCurrentWeightFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :current_weight
  end
end

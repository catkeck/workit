class ChangeDateInWeightToBeInteger < ActiveRecord::Migration
  def change
    change_column :weights, :date, :integer
  end
end

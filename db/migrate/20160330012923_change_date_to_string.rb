class ChangeDateToString < ActiveRecord::Migration
  def change
    change_column :foods, :date, :string
  end
end

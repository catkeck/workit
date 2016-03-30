class ChangeOtherDateToString < ActiveRecord::Migration
  def change
    change_column :weights, :date, :string
  end
end

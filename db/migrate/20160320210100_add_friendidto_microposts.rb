class AddFriendidtoMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :friend_id, :integer
  end
end

class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :friend_id
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

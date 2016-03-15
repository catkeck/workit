class FriendshipsController < ApplicationController

  def create
    @current_friend = User.find(params[:friend_id])
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship_2 = @current_friend.friendships.build(:friend_id => current_user.id)
    if @friendship.save && @friendship_2.save
      flash[:notice] = "Friend added"
      redirect_to current_user
    else
      flash[:notice] = "Can not add friend"
      redirect_to current_user
    end
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfriend(user)
    user.unfriend(current_user)
    flash[:notice] = "Removed friend"
    redirect_to current_user
  end
end

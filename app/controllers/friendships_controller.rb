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
    @friendship = current_user.friendships.find_by(id: params[:id])
    @friendship_2 = Friendship.where(user_id: @friendship.friend_id, friend_id: current_user.id).first
    unless @friendship.nil? 
      @friendship.destroy
    end
    unless @friendship_2.nil?
      @friendship_2.destroy
    end
    flash[:notice] = "Friendship destroyed"
    redirect_to current_user
  end
end

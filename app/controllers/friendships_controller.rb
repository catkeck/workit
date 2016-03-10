class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Friend added"
      redirect_to root_url
    else
      flash[:notice] = "Can not add friend"
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.firendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friend"
    redirect_to current_user
  end
end

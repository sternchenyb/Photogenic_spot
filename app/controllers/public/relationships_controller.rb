class Public::RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def relationship
    @user = User.find(params[:user_id])
    @followings = @user.followings
    @followers = @user.followers
  end
end

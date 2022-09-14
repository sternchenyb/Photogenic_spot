class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @spots = @user.spots.page(params[:page])
    @followings = @user.followings
    @followers = @user.followers
  end

  def cancel
    @user = current_user
  end

  def edit
    if @user = current_user
      render "edit"
    else
      redirect_to user_path(@user)
    end
  end

  def update
   @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image,:is_deleted,:email,:password)
  end
end

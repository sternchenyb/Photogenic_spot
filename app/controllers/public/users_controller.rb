class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @spots = @user.spots.page(params[:page])
    @followings = @user.followings
    @followers = @user.followers
    byebug
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

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:spot_id)
    @favorite_spots = Kaminari.paginate_array(Spot.find(favorites)).page(params[:page])
    @genres = Genre.all

      # 観光地を評価順で表示
    if params[:latest]
    @favorite_spots = Kaminari.paginate_array(Spot.where(id: favorites).latest).page(params[:page])
    elsif params[:old]
     @favorite_spots = Kaminari.paginate_array(Spot.where(id: favorites).old).page(params[:page])
    elsif params[:star_count]
     @favorite_spots = Kaminari.paginate_array(Spot.where(id: favorites).star_count).page(params[:page])
    else
     @favorite_spots = Kaminari.paginate_array(Spot.find(favorites)).page(params[:page])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:introduction,:profile_image,:is_deleted,:email,:password)
  end
end

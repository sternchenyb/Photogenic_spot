class Public::SpotsController < ApplicationController
 before_action :correct_user, only: [:edit,:destroy]

  def new
    @spot = Spot.new
  end

  def search
    @search_word = Spot.all.search(params[:keyword])
    @genres = Genre.all
    @keyword = "#{params[:keyword]}"

      # 観光地をソートで表示
    if params[:latest]
     @spots = @search_word.latest.page(params[:page])
    elsif params[:old]
     @spots = @search_word.old.page(params[:page])
    elsif params[:star_count]
     @spots = @search_word.star_count.page(params[:page])
    else
     @spots = @search_word.page(params[:page])
    end
  end

  def index
    @spots = Spot.page(params[:page])
    @genres = Genre.all

    # 観光地をソートで表示
    if params[:latest]
     @spots = Spot.latest.page(params[:page])
    elsif params[:old]
     @spots = Spot.old.page(params[:page])
    elsif params[:star_count]
     @spots = Spot.star_count.page(params[:page])
    else
     @spots = Spot.page(params[:page])
    end
  end

  def show
    @genres = Genre.all
    @spot = Spot.find(params[:id])
    @user = @spot.user
    @comment = Comment.new
    @comments = Comment.all
    gon.spot = @spot
  end

  def edit
      @spot = Spot.find(params[:id])
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id
   if @spot.save
     flash[:notice] = "You have created spot successfully."
    redirect_to spot_path(@spot)
   else
    @spots = Spot.all
    @user = current_user
    render :index
   end
  end

  def update
   @spot = Spot.find(params[:id])
   @spot.user_id = current_user.id
   if @spot.update(spot_params)
     flash[:notice] = "You have updated spot successfully."
    redirect_to spot_path(@spot)
   else
    render :edit
   end
  end

  def destroy
   @spot = Spot.find(params[:id])
   if @spot.destroy
     flash[:notice] = "You have deleted spot successfully."
    redirect_to spots_path
   end
  end

  private

  def correct_user
    spot = Spot.find(params[:id])
    if current_user.id != spot.user_id
      redirect_to spots_path
    end
  end

  def spot_params
    params.require(:spot).permit(:name,:address,:image,:caption,:genre_id,:star,:latitude,:longitude)
  end
end

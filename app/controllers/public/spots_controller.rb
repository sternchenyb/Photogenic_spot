class Public::SpotsController < ApplicationController

  def new
    @spot = Spot.find(params[:id])
  end

  def index
    @spots = Spot.page(params[:page])
    @genres = genre.all
  end
  
  def show
    @genres = genre.all
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
     flash[:notice] = "Book have deleted spot successfully."
    redirect_to spots_path
   end
  end

  private

  def spot_params
    params.require(:spot).permit(:name,:address,:spot_image,:caption,:star)
  end
end

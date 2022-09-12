class Admin::SpotsController < ApplicationController
   before_action :authenticate_admin!
   
  def show
   @spot = Spot.find(params[:id])
   @comments = Comment.all
  end
  
  def index
   @spots = Spot.page(params[:page])
  end
  
  def update
    @spot = Spot.find(params[:id])
    @genres = Genre.all
      @spot.update(spot_params)
      redirect_to admin_spot_path(@spot.id)
  end

  def destroy
    @spot = Spot.find(params[:id])
    @spot.destroy
    redirect_to admin_spots_path
  end

  private

    def spot_params
      params.require(:spot).permit(:name,:address,:image,:caption,:genre_id,:star)
    end

end

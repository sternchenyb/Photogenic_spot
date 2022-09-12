class Admin::CommentsController < ApplicationController
     before_action :authenticate_admin!
  def show
    @comment = Comment.find(params[:id])
    @user = User.find(params[:user_id])
    @spots = @user.spots.all
  end

  def destroy
     @spot = Spot.find(params[:spot_id])
     @comment = Comment.find(params[:id])
     @comment.destroy
     redirect_to admin_spot_path
  end

  private

 def comment_params
   params.require(:comment).permit(:comment,:user_id,:spot_id)
 end
end

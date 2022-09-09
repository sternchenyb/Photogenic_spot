class Public::CommentsController < ApplicationController
  before_action :authenticate_user! 
  before_action :correct_user, only: [:destroy]
  
  def create
     @spot = Spot.find(params[:spot_id])
     @comment = current_user.comments.new(comment_params)
     @comment.spot_id = @spot.id
     @comment.save
  end
  
  def destroy
     @spot = Spot.find(params[:spot_id])
     @comment = Comment.find(params[:id])
     @comment.destroy
  end

private

 def comment_params
   params.require(:comment).permit(:comment)
 end
 
 def correct_user
    comment = Comment.find(params[:id])
    if current_user.id != comment.user.id
        redirect_to spots_path
    end
 end
end

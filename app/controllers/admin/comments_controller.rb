class Admin::CommentsController < ApplicationController
     before_action :authenticate_admin!
  def index
    @user = User.find(params[:user_id])
  end

  def destroy
     @user = User.find(params[:user_id])
     @comment = Comment.find(params[:id])
     @comment.destroy
     redirect_to admin_user_comments_path(@user)
  end

  private

 def comment_params
   params.require(:comment).permit(:comment,:user_id,:spot_id)
 end
end

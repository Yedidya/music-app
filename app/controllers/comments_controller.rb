class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.create(comment_params)
    redirect_to version_path(params[:comment][:version_id])
  end

  

  private

  def comment_params
    return params.require(:comment).permit(:version_id, :user_id, :text)
  end

end

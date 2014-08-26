class Api::V1::CommentsController < ApplicationController

  def index
    @version = Version.find_by(:id => params[:id])
    @comments = @version.comments
    render json: @comments
  end

  def create
    @comment = Comment.create(:user_id => params[:user_id], :version_id => params[:id], :text => params[:comment])
    render json: @comment
  end

end
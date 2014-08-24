class SearchesController < ApplicationController

  def index
    @songs = Song.where("title like ?", "%#{params[:q]}%")
    tag = Tag.find_by(:name => params[:q])
    @songs += tag.songs if tag
    @user = User.find_by(:username => params[:q])
    @user_profile = User.find_by(:id => params[:id])
    #@songs += @user.songs
  end
end

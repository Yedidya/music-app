class SearchesController < ApplicationController

  def index
    @songs = Song.where("title like ?", "%#{params[:q]}%")
    tag = Tag.find_by(:name => params[:q])
    @songs += tag.songs if tag
    @user = User.find_by(:username => params[:q])
    #@songs += @user.songs
  end
end

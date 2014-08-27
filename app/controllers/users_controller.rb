class UsersController < ApplicationController
  respond_to :json

  def search
    @member = User.find_by(:username => params[:username])
    respond_with(@member)
  end

  def show
    @user = User.find_by(:id => params[:id])

    if @user 
      @songs = @user.songs
    else
      flash[:warning] = "There is no such user"
      redirect_to root_path
    end
    @title = "Songdub"
    @contributed_versions = Version.where(:user_id => current_user.id)
    @contributed_songs = []
    @contributed_versions.each do |version| 
    @contributed_songs << version.song
    end
    @contributed_songs.uniq!
  end
    
end

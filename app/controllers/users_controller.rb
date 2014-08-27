class UsersController < ApplicationController
  respond_to :json

  def search
    @member = User.find_by(:username => params[:username])
    respond_with(@member)
  end

  def show
    @user = User.find_by(:id => params[:id]) || current_user

    @songs = @user.songs

    @title = "Songdub"
    @contributed_versions = Version.where(:user_id => @user.id)
    @contributed_songs = []
    @contributed_versions.each do |version| 
    @contributed_songs << version.song unless version.song.user_id == @user.id
    end
    @contributed_songs.uniq!
  end
    
end

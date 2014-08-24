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
    @title = "MusicApp"
  end
  
end

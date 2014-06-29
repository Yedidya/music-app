class SongsController < ApplicationController

  def index
    @songs = Song.all
    @title = MusicApp
  end

  def new
    @song = Song.new
    @title = New Track
  end  

  def create
    @song = Song.create(params[:song])
    flash[:success] = "You have successfully created a new track!"
    redirect_to @song
  end

  def show
    @song = Song.find(params[:id])
    @title = @song.title
  end

  def edit
    @song = Song.find(params[:id])
    @title = "Edit Track"
  end

  def update
    @song = Song.find(params[:id])
    @song.update(params[:song])
    flash[:success] = "You have successfully edited your track's details!"
    redirect_to @song
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
  end
end


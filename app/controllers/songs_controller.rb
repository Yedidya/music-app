class SongsController < ApplicationController

  def index
    if current_user 
      @songs = current_user.songs.all
    elsif current_user.nil?
      @songs = Song.all
    end
    @title = "MusicApp"
  end

  def new
    @song = Song.new
    @title = "New Track"
  end  

  def create
    tags = params[:song][:tag_list].split(", ")
    @song = current_user.songs.create(params[:song])
    tags.each do |tag| 
      if Tag.find_by(:name => tag)
          @song.tags << tag
      else 
        @song.tags.create(:name => tag)
      end
    end
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
    flash[:success] = "You have successfully deleted your track."
    redirect_to "/songs/"
  end
end


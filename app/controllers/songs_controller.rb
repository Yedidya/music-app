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
    @user = User.find_by_email(params[:email])
    @title = "New Track"
  end  

  def create
    tags = params[:song][:tag_list].split(", ")
    @song = current_user.songs.create(song_params)
    @version = current_user.versions.create(:song_id => @song.id, :song_url => song_params[:song_url], :version_number => 1, :master => true, :message => "First version")
    tags.each do |tag| 
      if tag = Tag.find_by(:name => tag)
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
    @versions = @song.versions
    @title = @song.title
    @version = Version.new
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
    redirect_to songs_path
  end

  private
  def song_params
    return params.require(:song).permit(:title, :tag_list, :song_url)
  end
end


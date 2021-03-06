class VersionsController < ApplicationController

  def create
    @song = Song.find_by(:id => params[:version][:song_id])
    @latest_version = @song.versions.last
    @new_version = current_user.versions.create(version_params.merge({ :version_number => @latest_version.version_number + 1 }))
    
    flash[:success] = "You have successfully created a new version!"
    redirect_to song_path(params[:version][:song_id])
    @version = Version.find_by(:id => params[:id])
  end

  def show
    @version = Version.find_by(:id => params[:id])
    @new_comment = Comment.new
    @comments = @version.comments
  end

  def download
    @version = Version.find_by(:id => params[:id])
    @song = @version.song

    send_file("#{Rails.root}/public/" + @version.unmastered_file.url,
               filename: "#{@song.title}_V#{@version.version_number}.zip")
  end

  def make_master
    @version = Version.find_by(:id => params[:id])
    @version.song.versions.each do |version|
      version.update(:master => false)
    end
    @version.update(:master => true)
    redirect_to song_path(@version.song.id)
  end


  private 

  def version_params
    return params.require(:version).permit(:song_id, :song_url, :message, :unmastered_file)
  end
end

class VersionsController < ApplicationController

  def create
    @new_version = current_user.versions.create(version_params)

    flash[:success] = "You have successfully created a new track!"
    redirect_to @song
  end

  private 

  def version_params
    return params.require(:version).permit(:song_url, :message)
  end
end

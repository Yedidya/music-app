class VersionsController < ApplicationController

  def index
    @versions = Version.all
  end

  def new
    @version = Version.new
  end

  def create
    
  end

  def show
    version = Version.find_by(params[:id])
  end

end

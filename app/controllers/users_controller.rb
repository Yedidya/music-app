class UsersController < ApplicationController
  respond_to :json

  def search
    @member = User.find_by(:username => params[:username])
    respond_with(@member)
  end
  
end

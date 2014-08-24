class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def team_members
    @members = Song.find_by(:id => params[:song_id]).users
    render json: @members
  end

end
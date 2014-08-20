class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def team_members
    @members = TeamMember.where(:song_id => params[:song_id])
    render json: @members
  end

end
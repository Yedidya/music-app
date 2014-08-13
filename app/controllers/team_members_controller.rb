class TeamMembersController < ApplicationController
  def create
    @member = User.find_by(:username => params[:username])
    TeamMember.create(:user_id => @member.id, :song_id => params[:song_id], :status => "member")
    redirect_to song_path(params[:song_id])
  end
end

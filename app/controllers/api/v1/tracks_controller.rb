class Api::V1::VoicesController < ApplicationController

   def index
     @tracks = Track.all
     render json: @tracks
   end

  def get_tracks
    @tracks = Track.find_by(:id => params[:track_id]).users
    render json: @tracks
  end

end
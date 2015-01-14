class Api::V1::VoicesController < ApplicationController
  respond_to :json, :xml

   def index
     @tracks = Track.all
     respond_with(@tracks)
   end

  def show
    @track = Song.find_by(:id => params[:song_id]).users
    render json: @track
  end

end
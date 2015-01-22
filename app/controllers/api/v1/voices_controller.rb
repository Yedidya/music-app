class Api::V1::VoicesController < ApplicationController
  respond_to :json, :xml

   def index
     @track = Track.find_by(:id => params[song_id]).users
     @tracks = @track.all
     respond_with(@tracks)
   end

  def show
    track = Track.find_by(:id => params[:id])
    chunks = Chunk.where(:track_id => params[:id])
    voices = Voice.find_by_sql ["SELECT `voices`.* FROM `tracks_voices` LEFT JOIN `voices` ON `voices`.`id` = `tracks_voices`.`voice_id` WHERE `tracks_voices`.`track_id` = ?", params[:id]]
    chunk_voices = ChunkVoice.find_by_sql ["SELECT `chunks_voices`.* FROM `chunks` LEFT JOIN `chunks_voices` ON `chunks`.`id` = `chunks_voices`.`voice_id` WHERE `chunks`.`track_id` = ?", params[:id]]
    @results = [
      :id => track.id,
      :chunks => chunks.as_json,
      :voices => voices.as_json,
      :song_id => track.song_id,
      :updated_at => track.updated_at,
      :created_at => track.created_at,
      :chunk_voices => chunk_voices
    ]
   respond_with(@results)
  end

end
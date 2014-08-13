class Song < ActiveRecord::Base
    attr_accessor :tag_list
    has_and_belongs_to_many :tags
    belongs_to :user
    has_many :versions
    has_many :team_members

    mount_uploader :song_url, SongUploader

  # def addMember
  #   @song.users << User.find(params[:user_id])    respond_to do |format|
  #   format.html { redirect_to song, :notice => 'Added.' }
  # end


end

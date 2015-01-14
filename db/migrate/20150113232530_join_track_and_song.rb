class JoinTrackAndSong < ActiveRecord::Migration
  def change
     create_join_table :tracks, :songs
  end
end

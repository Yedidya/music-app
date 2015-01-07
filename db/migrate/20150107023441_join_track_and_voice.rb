class JoinTrackAndVoice < ActiveRecord::Migration
  def change
    create_join_table :tracks, :voices
  end
end

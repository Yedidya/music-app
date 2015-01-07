class JoinChunkAndVoice < ActiveRecord::Migration
  def change
    create_join_table :chunks, :voices
  end
end

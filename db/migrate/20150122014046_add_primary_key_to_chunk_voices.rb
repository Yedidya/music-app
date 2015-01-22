class AddPrimaryKeyToChunkVoices < ActiveRecord::Migration
  def change
    add_column :chunks_voices, :id, :primary_key
  end
end

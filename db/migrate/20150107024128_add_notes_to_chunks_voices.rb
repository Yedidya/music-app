class AddNotesToChunksVoices < ActiveRecord::Migration
  def change
    add_column :chunks_voices, :notes, :text
  end
end

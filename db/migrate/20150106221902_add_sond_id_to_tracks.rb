class AddSondIdToTracks < ActiveRecord::Migration
  def change
    change_table :tracks do |t|
      t.integer :song_id
    end
  end
end

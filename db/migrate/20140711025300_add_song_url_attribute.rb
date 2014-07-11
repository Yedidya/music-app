class AddSongUrlAttribute < ActiveRecord::Migration
  def change
    change_table :songs do |t|
      t.string :song_url
    end
  end
end

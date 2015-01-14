class FixTrackTitle < ActiveRecord::Migration
  def change
    rename_column :chunks, :tack_id, :track_id

  end
end

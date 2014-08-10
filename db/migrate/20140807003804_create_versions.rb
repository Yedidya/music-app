class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :song_url
      t.integer :song_id
      t.integer :version_number
      t.integer :user_id
      
      t.timestamps
    end
  end
end

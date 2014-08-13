class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :user_id
      t.integer :version_number
      t.integer :song_id
      t.string :song_url
      t.boolean :master

      t.timestamps
    end
  end
end

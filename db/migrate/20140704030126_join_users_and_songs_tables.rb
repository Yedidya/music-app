class JoinUsersAndSongsTables < ActiveRecord::Migration
  def change
    create_join_table :users, :songs
  end
end

class JoiningSongsAndTags < ActiveRecord::Migration
  def change
    create_join_table :tags, :songs
  end
end

class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer :user_id
      t.integer :song_id
      t.string :status

      t.timestamps
    end
  end
end

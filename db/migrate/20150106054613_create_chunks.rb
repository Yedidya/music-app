class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.integer :position
      t.integer :length
      t.string :tack_id

      t.timestamps
    end
  end
end

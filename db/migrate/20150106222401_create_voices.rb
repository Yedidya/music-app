class CreateVoices < ActiveRecord::Migration
  def change
    create_table :voices do |t|
      t.integer :sampling_rate
      t.string :url
      t.blob :sample

      t.timestamps
    end
  end
end

class ChangeBinaryToBlob < ActiveRecord::Migration
  def change
    change_table :voices do |t|
      t.change :sample, :blob
    end
  end
end

class AddSampleToVoices < ActiveRecord::Migration
  def change
    change_table :voices do |t|
      t.binary :sample
    end
  end
end

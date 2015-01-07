class RemoveSampleFromVoices < ActiveRecord::Migration
  def change
    remove_column :voices, :sample, :string
  end
end

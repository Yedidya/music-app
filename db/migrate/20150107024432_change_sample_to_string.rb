class ChangeSampleToString < ActiveRecord::Migration
  def change
    change_table :voices do |t|
      t.change :sample, :string
    end
  end
end

class AddMesageToVersion < ActiveRecord::Migration
  def change
    add_column :versions, :message, :string
  end
end

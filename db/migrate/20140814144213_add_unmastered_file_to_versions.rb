class AddUnmasteredFileToVersions < ActiveRecord::Migration
  def change
    add_column :versions, :unmastered_file, :string
  end
end

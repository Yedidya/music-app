class Version < ActiveRecord::Base
  belongs_to :user
  belongs_to :song

  mount_uploader :song_url, SongUploader
  mount_uploader :unmastered_file, UnmasteredFileUploader
end

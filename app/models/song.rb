class Song < ActiveRecord::Base
  attr_accessor :tag_list
  has_and_belongs_to_many :tags
  belongs_to :user
  has_many :versions
  has_many :team_members

  mount_uploader :song_url, SongUploader

  def tag_names
    self.tags.map(&:name).compact
  end

end

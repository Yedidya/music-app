class Track < ActiveRecord::Base
  belongs_to :song
  has_many :chunks
end

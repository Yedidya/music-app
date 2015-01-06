class Chunk < ActiveRecord::Base
  belongs_to :track
  has_many :voices
end

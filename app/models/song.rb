class Song < ActiveRecord::Base
    attr_accessor :tag_list
    has_and_belongs_to_many :tags
    belongs_to :user
end

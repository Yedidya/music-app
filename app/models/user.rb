class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :songs
  has_many :versions
  has_many :team_members
  has_many :comments

  mount_uploader :photo, PhotoUploader

end

class Location < ApplicationRecord
  belongs_to :user
  has_many :photos
  validates :user, presence: true
  mount_uploader :cover, PhotoUploader
end

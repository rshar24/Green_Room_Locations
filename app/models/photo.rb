class Photo < ApplicationRecord
  belongs_to :location
  validates :picture, :location, presence: true

  mount_uploader :picture, PhotoUploader
end

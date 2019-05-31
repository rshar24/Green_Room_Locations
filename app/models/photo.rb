class Photo < ApplicationRecord
  belongs_to :location

  mount_uploader :picture, PhotoUploader
end

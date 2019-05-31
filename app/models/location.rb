class Location < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reviews
  validates :user, presence: true
  mount_uploader :cover, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

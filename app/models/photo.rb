class Photo < ApplicationRecord
  belongs_to :location
  validates :url, presence: true
end

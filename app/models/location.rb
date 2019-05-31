class Location < ApplicationRecord

  belongs_to :user
  has_many :photos
  validates :name, :address, :price, :user, :description, :cover, presence: true

  mount_uploader :cover, PhotoUploader

  include PgSearch
  pg_search_scope :global_search,
    against: [ :address, :name, :description ],
     associated_against: {
      user: [ :first_name, :last_name ]
    },
    using: {
      tsearch: { prefix: true }
    }


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end

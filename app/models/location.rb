class Location < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reviews
  validates :user, presence: true
  validates :name, :address, :price, :user, :description, :cover, presence: true

  mount_uploader :cover, PhotoUploader

  include PgSearch
  pg_search_scope :global_search,
    against: [:address, :name, :description],
    associated_against: {
    user: [:first_name, :last_name]
    },
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def avg_rating
    total = self.reviews.count
    total_sum = 0.0
    if self.reviews.exists?
      self.reviews.each do |review|
        total_sum += review.rating
      end
      raw_rating = total_sum / total
      (raw_rating * 2).round.to_f / 2
    else
      0
    end
  end

  def avg_rating_dec
    total = self.reviews.count
    total_sum = 0.0
    if self.reviews.exists?
      self.reviews.each do |review|
        total_sum += review.rating
      end
      (total_sum.to_f / total).round(1)
    else
      return 0.0
    end
  end

  def reviews_count
    if self.reviews.count.nil?
      return 0
    else
      return self.reviews.count
    end
  end
end

class Review < ApplicationRecord
  belongs_to :location

  validates :content, presence: true
  validates :rating, presence: true, numericality: true, inclusion: { in: [1, 2, 3, 4, 5] }
end

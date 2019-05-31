class Booking < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_one :review
  validates :entry_date, presence: true
  validates :exit_date, presence: true
  validate :not_blank_date
  after_validation :set_price

  def set_price
    if !entry_date.nil? && !exit_date.nil?
      self.booking_price = self.location.price * (self.exit_date - self.entry_date).to_i
    end
  end

  def not_blank_date
    if !entry_date.nil? && !exit_date.nil?
      errors.add(:entry_date, "can't be in the past") if entry_date < Date.today
      errors.add(:entry_date, "can't be after the exit date") if entry_date > exit_date
    end
  end
end

class AddRatingAndBookingToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :rating, :integer
    add_reference :reviews, :booking, foreign_key: true
  end
end

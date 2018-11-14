class Flat < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :pictures
  has_many :users, through: :bookings # users as guest
  belongs_to :user # user as host

  def average_rating
    if number_of_review == 0
      return "No reviews yet"
    else
      return reviews.pluck(:rating).sum / reviews.length.to_i
    end
  end

  def number_of_review
    reviews.length.to_i
  end
end

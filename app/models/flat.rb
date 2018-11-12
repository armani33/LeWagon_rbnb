class Flat < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :users, through: :bookings # users as guest
  belongs_to :user # user as host

  def average_rating
    return reviews.pluck(:rating).sum / reviews.length.to_i
  end

  def number_of_review
    reviews.length.to_i
  end
end

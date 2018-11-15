require 'date'
class Flat < ApplicationRecord
  include PgSearch
  has_many :bookings
  has_many :reviews
  has_many :pictures
  has_many :users, through: :bookings # users as guest
  belongs_to :user # user as host

  pg_search_scope :search_by_postalcode_city_and_country,
    against: [:postal_code, :city, :country],
    using: {
      tsearch: { prefix: true } # <-- now `france par` will return something!
    }
  pg_search_scope :search_by_guest,
    against: [:guest_capacity]

  # scope :check_date_availability, ->(arrival_date, leaving_date) { self.bookings.where.not('start_date < ? OR end_date > ?', arrival_date, leaving_date) }

  def availability?(ar_date, leav_date)
    arrival_date = ar_date.to_date
    leaving_date = leav_date.to_date


    sql_query = <<-SQL
      start_date < :arrival_date AND end_date > :leaving_date
      OR start_date BETWEEN :arrival_date AND :leaving_date
      OR end_date BETWEEN :arrival_date AND :leaving_date
    SQL

    result = self.bookings.where(sql_query, arrival_date: arrival_date, leaving_date: leaving_date)
    return result.empty?
  end
  # def check_date_availability(flats, arrival_date, leaving_date)
  #   flats.select do |flat|
  #     flat.bookings.all? do |booking|
  #       booking.where('start_date < ? AND end_date > ?', arrival_date, leaving_date)
  #     end
  #   end
  # end
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

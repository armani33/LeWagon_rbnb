class Booking < ApplicationRecord
  include PgSearch
  belongs_to :user
  belongs_to :flat

  pg_search_scope :search_by_date,
    against: [:start_date, :end_date]
end

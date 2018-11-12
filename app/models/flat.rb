class Flat < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings # users as guest
  belongs_to :user # user as host
end

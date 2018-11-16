# require 'faker'
puts 'Cleaning database...'

Booking.destroy_all
Review.destroy_all
Flat.destroy_all
User.destroy_all





puts 'creating new database'
# 10.times do

#   user = User.new(
#     first_name: Faker::Name.first_name ,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     avatar: Faker::Avatar.image,
#     password: "aaaa"
#     )
#   user.save!

#   3.times do
#   category = ["full appartement", "full house", "room"].sample(1)[0]
#   capacity = (1..10).to_a.sample
#   description = ["Nice place", "Charming place", "Historic place", "Well situation place", "Friendly place", "All featured place"].sample(1)[0]
#   price =  (20..200).to_a.sample(1)[0]

#     flat = Flat.new(
#       address:Faker::Address.street_address,
#       postal_code:Faker::Address.zip_code,
#       city: Faker::Address.city,
#       country: Faker::Address.country,
#       guest_capacity: capacity,
#       price: price,
#       category: category,
#       description: description
#       )
#     flat.user = user
#     flat.save!

#       50.times do
#         content = ["Good", "Bad", "Interesting", "Perfect", "Discusting", "Original", "Recommanded", "Cheap", "Expensive"].sample(1)[0]
#         rating = (0..5).to_a.sample(1)[0]
#         review = Review.new(
#           content: content,
#           rating: rating
#           )
#         review.flat = flat
#         review.save!
#         end
#       # 20.times do
#       #   # accepted = ["true", "false"].sample(1)[0]
#       #   booking = Booking.new (
#       #   )
#       #   booking.user = user
#       #   booking.flat = flat
#       #   booking.save!
#       # end # end booking
# end #end flat
# end # end user
# puts 'end creation database'

puts 'Finished!'

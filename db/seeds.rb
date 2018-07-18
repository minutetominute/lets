# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

num_users = 30
num_requests = 10
percent_completed = 0.20

# user creation

names = num_users.times.map do |idx|
  Faker::Name.name
end

users = names.map do |name|
  User.create!(name: name)
end

# request creation

requests = num_users.times.map do |idx|
  Request.create!(
    user: users.sample,
    description: Faker::TheITCrowd.quote
  )
end

# offer creation

requests.each do |request|
  potential_offer_users = users - [request.user]

  offer_users = potential_offer_users.sample(
    Random.rand((2..(potential_offer_users.count/2)))
  )

  offers = offer_users.each do |offer_user|
    Offer.create!(
      user: user,
      request: request,
      karma_points: Random.rand((1..100)),
      description: Faker::Hacker.say_something_smart
    )
  end

  cancelled_offers = offers.sample(2)
  cancelled_offers.each(&:cancel!)

  rejected_offers = (offers - cancelled_offers).sample(2)
  rejected_offers.each(&:timeout!)
end

# transaction creation

requests.sample(requests.count * percent_completed).each do |request|
  pending_offers = request.pending_offers

  completed_offer = pending_offers.sample

  completed_transaction = Transaction.create!(
    offer: completed_offer
  )
  completed_transaction.complete!

  cancelled_offer = (pending_offers - [completed_offer]).sample

  cancelled_transaction = Transaction.create!(
    offer: cancelled_offer
  )

  cancelled_transaction.cancel!
end

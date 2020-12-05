# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
Idea.destroy_all

50.times do
    created_at = Faker::Date.backward(days:365*5),
    Idea.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::TvShows::SouthPark.quote, 
        created_at:created_at,
        updated_at:created_at,
    
        )
       
end



idea =Idea.all

Review.destroy_all
idea.each do |q|
    5.times do
        Review.create(
            body: Faker::TvShows::SouthPark.quote,
            idea_id: q.id
        )
    end
end
review =Review.all

50.times do
    User.create({
      first_name: Faker::Games::SuperSmashBros.fighter,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email
    })
  end
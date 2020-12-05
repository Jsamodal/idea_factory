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
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
User.destroy_all
PASSWORD='supersecret'
Idea.destroy_all
super_user = User.create(
    first_name: 'Jon',
    last_name: 'Snow',
    email:"jonsnow@jo.gov",
    password: 'qweqwe',

)

10.times do 
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    User.create(
        first_name:first_name,
        last_name:last_name,
        email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
        password: 'qweqwe'
    )
end

users = User.all

50.times do
    created_at = Faker::Date.backward(days:365*5),
    Idea.create(
        title: Faker::Hacker.say_something_smart,
        body: Faker::TvShows::SouthPark.quote, 
        created_at:created_at,
        updated_at:created_at,
        user: users.sample
    )
       
    

end

idea =Idea.all

Review.destroy_all
idea.each do |q|
    5.times do
        Review.create(
            body: Faker::TvShows::SouthPark.quote,
            idea_id: q.id,
            user: users.sample
            )
    end
end
review =Review.all






require "date"
puts "🌱 Seeding spices..."

# Seed your database here
# create users
50.times do
    user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "password"
    )
  end
  50.times do
    movie = Movie.create(
      title: Faker::Movie.title,
      image: Faker::LoremFlickr.image,
      description: Faker::Lorem.sentence,
      year: Faker::Date.between(from: '2015-02-28', to: '2022-12-05'),
      available: ['available', 'not released', 'fully booked'].sample,
      user_id: rand(1..50)
    )
  end

puts "✅ Done seeding!"

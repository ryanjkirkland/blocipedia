# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



 u = User.create(
  email: "foo@example.com",
  password: "password",
  password_confirmation: "password"
  )
u.confirm

w = Wiki.create(
  title: "Test Wiki",
  body: "This is a wiki full of test stuff.",
  private: false
  )

25.times do

  password = Faker::Internet.password(6, 8)

  User.create!(
  email: Faker::Internet.email,
  password: password,
  password_confirmation: password
  )
end
user = User.all

10.times do
  Wiki.create!(
  title: Faker::Lorem.word,
  body: Faker::Lorem.paragraph
  )
end
wiki = Wiki.all


puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "Seeds finished"

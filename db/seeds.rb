# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create!(name:"user1")
user2 = User.create!(name:"user2")
room1 = Room.create!(name:"room1")
room2 = Room.create!(name:"room2")
#Message.create!(content: "msg1", user: user1, room: room1)

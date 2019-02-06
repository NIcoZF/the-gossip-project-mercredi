# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
Comment.destroy_all
Like.destroy_all
PrivateMessage.destroy_all
JoinTableGossipTag.destroy_all
JoinTableUserPrivateMessage.destroy_all
=begin
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'cities'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'users'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'gossips'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'tags'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'comments'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'likes'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'private_messages'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'join_table_gossip_tags'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'join_table_user_private_messages'")
=end

10.times do
  city = City.create!(name: Faker::Address.unique.city)
end

10.times do
  user = User.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, city_id:(rand(City.first.id..City.last.id)), description: Faker::Food.description, age: Faker::Number.number(2), email: Faker::Internet.email)
end

20.times do
  gossip = Gossip.create!(title: Faker::Book.unique.title, content: Faker::TvShows::Simpsons.quote, user_id:(rand(User.first.id..User.last.id)))
end

10.times do
  tag = Tag.create!(title: Faker::Music::RockBand.name)
end

=begin
20.times do
  comment = Comment.create!(content: Faker::Seinfeld.quote, user_id:(rand(User.first.id..User.last.id)), gossip_id:(rand(Gossip.first.id..Gossip.last.id)))
end
=end

=begin
20.times do
  like = Like.create!(user_id:(rand(User.first.id..User.last.id)), imageable_id:(rand(Gossip.first.id..Gossip.last.id)))
end
=end

20.times do
  private_message = PrivateMessage.create!(content: Faker::Movies::PrincessBride.quote, sender_id:(rand(User.first.id..User.last.id)))
end

15.times do
  join_table_gossip_tag = JoinTableGossipTag.create!(gossip_id:(rand(Gossip.first.id..Gossip.last.id)), tag_id:(rand(Tag.first.id..Tag.last.id)))
end

30.times do
  join_table_user_private_message = JoinTableUserPrivateMessage.create!(recipient_id:(rand(User.first.id..User.last.id)), private_message_id:(rand(PrivateMessage.first.id..PrivateMessage.last.id)))
end

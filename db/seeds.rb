# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FFaker::Random.seed = 42
# Create some users
10.times do
	User.find_or_create_by name: FFaker::Internet.user_name
end
# Lets first 7 of them to be creators
User.first(7).each { |u| u.update creator: true }
# lets first 2 of them to be moderators
User.first(2).each { |u| u.update moderator: true }

# Generate some posts
creators = User.where creator: true
20.times do
	body = FFaker::HipsterIpsum.paragraphs(20).join "\n\n"
	user = creators[FFaker::Random.rand creators.length]
	Post.create_with(body: body, user: user)
		.find_or_create_by(title: FFaker::HipsterIpsum.sentence)
end

# Generate some commentaries
users = User.all
posts = Post.all
200.times do
	post = posts[FFaker::Random.rand posts.length]
	user = users[FFaker::Random.rand users.length]
	body = FFaker::HipsterIpsum.paragraph
	Commentary.find_or_create_by user: user, post: post, body: body
end

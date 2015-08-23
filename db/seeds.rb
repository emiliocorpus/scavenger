# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []

User.create(first_name: 'admin', last_name: 'admin', email: 'coolgai123@hotmail.com', username: 'admin', password: '123456')


10.times do 
	users << User.create(first_name: Faker::Name.first_name,
					last_name: Faker::Name.last_name,
					username: Faker::Internet.user_name,
					email: Faker::Internet.email,
					password: '123456')
end

users.each do |user|
	
	10.times do 
		user.hunts.create(description: Faker::Lorem.paragraph,
						longitude: Faker::Address.longitude,
						latitude: Faker::Address.latitude)
	end

	user.hunts.each do |hunt|
		5.times do
			hunt.clues.create(description: Faker::Lorem.paragraph,
						longitude: Faker::Address.longitude,
						latitude: Faker::Address.latitude, 
						answer: Faker::Lorem.sentence)
		end
	end

end






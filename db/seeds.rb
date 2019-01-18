# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shelter.all.map(&:destroy)
puts "Creating Shelter and Pets --->"
shelter = FactoryBot.create(:shelter, :with_pets)
admin_shelter = FactoryBot.create(:shelter, :admin)

admin_user = FactoryBot.create(:user)
admin_user.create_account!(account_type: 'admin', shelter: admin_shelter)
shelter_user = FactoryBot.create(:user)
shelter_user.create_account(account_type: 'shelter', shelter: shelter)

puts "Shelter id: #{shelter.id}"
puts "Admin user token: #{admin_user.id}"
puts "Shelter user token: #{shelter_user.id}"
puts "Done..."
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding admin user"
admin = User.find_or_initialize_by_email("admin@test.com")
if admin.new_record?
  admin.password = "password"
  admin.password_confirmation = "password"
  admin.save!
end
puts "Done!"

puts 'ROLES'
["admin", "user"].each do |role|
  Role.find_or_create_by_name(role)
  puts 'role: ' << role
end
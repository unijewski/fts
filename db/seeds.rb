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

unless Article.count > 0
  100.times do |i|
    Article.transaction do
      article = Article.new
      article.title = Faker::Lorem.words(5).join(" ")
      article.content = Faker::Lorem.paragraphs.join
      article.save!
    end
  end
end
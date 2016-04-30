# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seeding data..."

5.times do |i|
  Sponsor.create(title: "Mr", first_name:"John#{i}", last_name: "Doe#{i}", email: "jdoe#{i}@xyz.com", phone: "0430188909" )
end

8.times do |i|
  Student.create(first_name:"Ann#{i}", last_name: "Mary#{i}", email: "amary#{i}@xyz.com", phone: "0437899090", address: "blah", faculty: "Engineering", department: "CSE" )
end

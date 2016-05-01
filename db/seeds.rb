# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seeding data..."

3.times do |i|
  Sponsor.create(title: "Mr", first_name:"John#{i}", last_name: "Doe#{i}", email: "jdoe#{i}@xyz.com", phone: "0430188909" )
end

5.times do |i|
  Student.create(first_name:"Ann#{i}", last_name: "Mary#{i}", email: "amary#{i}@xyz.com", phone: "0437899090", address: "blah", faculty: "Engineering", department: "CSE" )
end

Scholarship.create(amount:25,
                   start_date:DateTime.strptime("09/01/2016 19:00", "%m/%d/%Y %H:%M"),
                   end_date: DateTime.strptime("09/01/2017 19:00", "%m/%d/%Y %H:%M"),
                   status: Scholarship::STATUSES[0],
                   sponsor_id:1,
                   student_id:1,
                   created_at:Time.now.to_datetime,
                   updated_at:Time.now.to_datetime)

Donation.create(sponsor_id:1,
                 scholarship_id:1,
                 amount:250,
                 valid_from:DateTime.strptime("09/01/2016 19:00", "%m/%d/%Y %H:%M"),
                 num_of_months: 12,
                 created_at:Time.now.to_datetime,
                 updated_at:Time.now.to_datetime)

Payment.create(student_id:1,
                scholarship_id:1,
                amount:2500,
                from_account:12345,
                to_account:45678,
                external_ref: "ref",
                notes: "Some notes",
                created_at:Time.now.to_datetime,
                updated_at:Time.now.to_datetime)
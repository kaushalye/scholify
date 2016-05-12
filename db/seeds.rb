# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seeding data..."
3.times do |i|
  fname = Faker::Name.first_name
  Sponsor.create(title: "Mr", first_name:fname, last_name: Faker::Name.last_name, email: Faker::Internet.email(fname), phone:Faker::PhoneNumber.phone_number )
end

5.times do |i|
  fname = Faker::Name.first_name
  Student.create(first_name: fname, last_name: Faker::Name.last_name, email: Faker::Internet.email(fname), phone:Faker::PhoneNumber.phone_number , address: "#{Faker::Address.street_address}, #{Faker::Address.city_prefix } #{Faker::Address.city_suffix}, #{Faker::Address.state} " , faculty: Student::FACULTIES.sample, department: Student::DEPARTMENTS.sample )
end

Scholarship.create(amount:25,
                   start_date: Faker::Date.between(2.days.ago, Date.today),#DateTime.strptime("09/01/2016 19:00", "%m/%d/%Y %H:%M"),
                   end_date: Faker::Date.between(1.year.from_now, 2.year.from_now), #DateTime.strptime("09/01/2017 19:00", "%m/%d/%Y %H:%M"),
                   status: Scholarship::STATUSES.sample,
                   sponsor_id:1,
                   student_id:1,
                   created_at:Time.now.to_datetime,
                   updated_at:Time.now.to_datetime)

Donation.create(sponsor_id:2,
                 scholarship_id:1,
                 amount:250,
                 valid_from:Date.today,
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
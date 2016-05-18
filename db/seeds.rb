# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seeding data..."
6.times do |i|
  fname = Faker::Name.first_name
  Sponsor.create(title: Sponsor::TITLES.sample, first_name:fname, last_name: Faker::Name.last_name, email: Faker::Internet.email(fname), phone:Faker::PhoneNumber.phone_number )
end

#create 5 studennts and a scholarship to each
5.times do |i|
  fname = Faker::Name.first_name
  student = Student.create(first_name: fname, last_name: Faker::Name.last_name, email: Faker::Internet.email(fname), phone:Faker::PhoneNumber.phone_number , address: "#{Faker::Address.street_address}, #{Faker::Address.city_prefix } #{Faker::Address.city_suffix}, #{Faker::Address.state} " , faculty: Student::FACULTIES.sample, department: Student::DEPARTMENTS.sample )

  Scholarship.create(amount:2500,
                     start_date: Faker::Date.between(5.months.ago, Date.today),#DateTime.strptime("09/01/2016 19:00", "%m/%d/%Y %H:%M"),
                     end_date: Faker::Date.between(1.year.from_now, 2.year.from_now), #DateTime.strptime("09/01/2017 19:00", "%m/%d/%Y %H:%M"),
                     status: Scholarship::STATUSES[0],
                     sponsor_id:1,
                     student_id:student.id,
                     created_at:Time.now.to_datetime,
                     updated_at:Time.now.to_datetime)

end

Donation.create(sponsor_id:1,
                 scholarship_id:1,
                 amount:250,
                 valid_from:Date.today,
                 num_of_months: 12,
                 created_at:Time.now.to_datetime,
                 updated_at:Time.now.to_datetime)

BulkTransaction.create(settled_date:Date.today,
                       sender: Faker::Name.first_name,
                       amount: 100,
                       amount_lkr: 10000,
                       rate: 100,
                       bank_date: Date.today,
                       chq_no: Faker::Number.number(10),
                       bank_acc: Faker::Number.number(10),
                       beneficiary: Faker::Name.first_name,
                       notes:Faker::Lorem.sentence,
                       effective_year: 2016,
                       effective_months: 3
                )
#add two payments for student 1
(20162 .. 20164).each do |i|
  Payment.create(student_id:1,
                 scholarship_id:1,
                 month:i,
                 amount:2500,
                 to_account:Faker::Number.number(10),
                 notes: Faker::Lorem.sentence,
                 created_at:Time.now.to_datetime,
                 updated_at:Time.now.to_datetime)

end
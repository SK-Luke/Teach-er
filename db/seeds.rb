# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This is to seed Student
random = ['8','9']
# Will add more location if need be
location = ["Jurong", "Tampines", "Yishun", "Labrador", "Raffles Place"]
# Either have number of no number
contact_num = ["+65 #{random.sample}#{Faker::Number.number(digits: 7)}", ""]
# Description
subject = ["English", "Maths", "Science", "History", "Geography", "Social Studies", "Arts", "A-Math", "Mother Tongue"]
# grade
grade = ["Secondary-1", "Secondary-2", "Secondary-3", "Secondary-4/5"]
# Content
contents = ["They/Them pretty good!", "We blazed", "Good tutor, will come back again!", "Shit tutor, don't go for this person"]
# Just playing
num = 143596825983245

# Destory all Database
puts "Clearing database..."
User.destroy_all
Subject.destroy_all
Booking.destroy_all
Review.destroy_all
Schedules.destroy_all
Availabilities.destroy_all

puts "Seeding your shit"
puts "Go get a drink, its gonna take years"

# Create users 
20.times do
  new_user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    contact_number: "#{contact_num.sample}",
    location: "#{location.sample}",
    description: "From #{Faker::Educator.secondary_school} seeking tuition for #{subject.sample}",
    role: "Student",
    password: "password"
  )
  new_user.save!
  puts "1 down, #{num -= 1} more to go!"
end

50.times do
  locate = location.sample
  subs = subject.sample
  new_user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email,
    contact_number: "#{contact_num.sample}",
    location: "#{locate}",
    description: "From #{Faker::Educator.university} teaching #{subject.sample}",
    role: "Student",
    password: "password"
  )
  new_user.save!

  # Seed for subjects
  count = 0
  num = (101..151).to_a.sample
  new_subject = Subject.new(
    name: "#{subs}",
    grade: "#{grade.sample}",
    user_id: "#{num}".to_i,
    description: "Much #{subs} very wow",
    hourly_rate: Faker::Number.number(digits: 10).round,
    # booking_id: "#{count += 1}".to_i
  )
  new_subject.save!

  new_booking = Booking.new(
    subject_id: "#{count += 1}".to_i
  )
  puts "1 down, #{num -= 1} more to go!"
end

# Seed for review
10.times do
  content: "#{contents.sample}"
  rating: (1..5).to_a
end

puts "Finished, now get back to work!!"
puts "jk, love you <3"

# create_table "bookings", force: :cascade do |t|
#   t.datetime "start_datetime"
#   t.datetime "end_datetime"
#   t.boolean "confirmed", default: false
#   t.datetime "created_at", precision: 6, null: false
#   t.datetime "updated_at", precision: 6, null: false
# end




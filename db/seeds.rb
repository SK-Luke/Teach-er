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
subject = Subject::SUBJECTS
# grade
grade = ["Secondary-1", "Secondary-2", "Secondary-3", "Secondary-4/5"]
# Content
contents = ["They/Them pretty good!", "We blazed", "Good tutor, will come back again!", "Shit tutor, don't go for this person", "#{Faker::Quotes::Shakespeare.as_you_like_it_quote}"]
# Just playing
num = 143596825983245
# Destory all Database
puts "Clearing database..."
# Booking.destroy_all
# Review.destroy_all
# Subject.destroy_all
# Availability.destroy_all
# User.destroy_all
# Schedules.destroy_all
puts "Seeding your shit"
puts "Go get a drink, its gonna take years"
# Create Student users
puts "Creating Users"
5.times do
  new_user = User.new(
    email: Faker::Internet.email,
    username: Faker::Name.name,
    location: "#{location.sample}",
    description: "From #{Faker::Educator.secondary_school} seeking tuition for #{subject.sample}",
    role: "Student",
    contact_number: "#{contact_num.sample}",
    password: "password"
  )
  new_user.save!
  # puts "1 down, #{num -= 1} more to go!"
end
# # Create Teacher users
puts "Creating Teachers"
5.times do
  locate = location.sample
  subs = subject.sample
  new_user = User.new(
    email: Faker::Internet.email,
    username: Faker::Name.name,
    location: "#{locate}",
    description: "From #{Faker::Educator.university} teaching #{subject.sample}",
    role: "Teacher",
    contact_number: "#{contact_num.sample}",
    password: "password"
  )
  new_user.save!
end
  # Seed for subjects
puts "Creating Subjects"
all_users = User.all
all_users.each do |user|
  subs = Subject::SUBJECTS.sample
  teacher = User.where("role = 'Teacher'").sample
  # all_user = User.all.count
  # choose_user = User.all.sample
  new_subject = Subject.new(
    grade: [grade.sample],
    description: "Much #{subs} very wow",
    hourly_rate: Faker::Number.number(digits: 10).round,
    user: user,
    title: subs
    # booking_id: "#{count += 1}"
)
  new_subject.save!
end
  #Seed for bookings
puts "Creating Bookings"
50.times do
  # count = 0
  subject = Subject.all.sample
  student = User.where("role = 'Student'").sample
    new_booking = Booking.new(
      start_time: Time.now,
      end_time: Time.now + 1,
      student: student,
      subject: subject,
      grade: grade.sample
    )
    # puts "1 down, #{num -= 1} more to go!"
    new_booking.save!
end
# Seed for review400 - 405
puts "Creating Reviews"
User.all.each do |user|
  5.times do
  # student = User.where(role: 'Student').sample
    new_review = Review.new(
      content: contents.sample,
      rating: (1..5).to_a.sample,
      user: user
    )
    new_review.save!
  end
end
#Seed for availabilities
puts "Creating Availabilities"
User.where(role: 'Teacher').each do |teacher|
  availability = Availability.new(start_time: DateTime.now.beginning_of_hour, end_time:  DateTime.now.beginning_of_hour + 1*60*60, user: teacher)
  availability.save!
end

puts "finished"

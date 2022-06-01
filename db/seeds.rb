# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

random = ['8','9']
location = []

5.times do 
  new_user = User.create(
    name: Faker::Name.name
    email: Faker::Internet.email
    contact_number: "+65" + " " + random.sample + Faker::Number.Number(digits: 7).to_s
    location: 
    description: "From" + Faker::Educator.secondary_school
    role: "100"
  )
end


create_table "users", force: :cascade do |t|
  t.string "email", default: "", null: false
  t.string "encrypted_password", default: "", null: false
  t.string "reset_password_token"
  t.datetime "reset_password_sent_at"
  t.datetime "remember_created_at"
  t.datetime "created_at", precision: 6, null: false
  t.datetime "updated_at", precision: 6, null: false
  t.string "username"
  t.string "location"
  t.text "description"
  t.string "role"
  t.string "contact_number"
  t.index ["email"], name: "index_users_on_email", unique: true
  t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
end




# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ActionMailer::Base.perform_deliveries = false
#
10.times do |n|
  email = Faker::Internet.email
  password = "111111"
  User.create!(email: email,
               password: password,
               admin: false,
               confirmed_at: Time.now
               )
end
User.create(email: "admin@example.com", password: "111111", admin: true, confirmed_at: Time.now)

10.times do |n|
  student_furigana = Gimei.name.hiragana
  student_name = Gimei.name.kanji
  sex = Faker::Number.between(from: 1, to: 2)
  birthday = Faker::Date.between(from: '1959-1-1', to: '2001-12-31')
  telephone = '0'+ Faker::Lorem.characters(number: 10, min_numeric: 10)
  cellphone = '0'+ Faker::Lorem.characters(number: 10, min_numeric: 10)
  post_code = Faker::Lorem.characters(number: 3, min_numeric: 3) + '-' + Faker::Lorem.characters(number: 4, min_numeric: 4)
  address = Gimei.address.city.kanji + Gimei.address.town.kanji + Faker::Lorem.characters(number: 1, min_numeric: 1) + '-' + Faker::Lorem.characters(number: 2, min_numeric: 2)
  parents_furigana = Gimei.hiragana
  parents_name = Gimei.name.kanji
  relationship = '祖母'
  Student.create!(student_furigana: student_furigana,
                  student_name: student_name,
                  sex: sex,
                  birthday: birthday,
                  telephone: telephone,
                  cellphone: cellphone,
                  post_code: post_code,
                  address: address,
                  parents_furigana: parents_furigana,
                  parents_name: parents_name,
                  relationship: relationship,
                  user_id: User.find(n+1).id,
                  )
end

10.times do |n|
  name = Gimei.kanji
  birthday = Faker::Date.between(from: '1959-1-1', to: '2001-12-31')
  FamilyEnvironment.create!(relationship: '祖母',
                             name: name,
                             birthday: birthday,
                             age: n + 60,
                             family: "兄",
                             student_id: Student.find(n+1).id,
                             )
end

10.times do |n|
  name = Gimei.name.kanji
  telephone = '0'+ Faker::Lorem.characters(number: 10, min_numeric: 10)
  birthday = Faker::Date.between(from: '1959-1-1', to: '2001-12-31')
  EmergencyContact.create!(name: name,
                           relationship: '祖母',
                           contact_address: birthday,
                           telephone: telephone,
                           student_id: Student.find(n+1).id,
                           )
end

10.times do |n|
  Contact.create!(title: "test#{n + 1}",
                  user_id: User.find(n+1).id,
                  )
end

10.times do |n|
  Comment.create!(content: "sample#{n + 1}",
                  user_id: User.find(n+1).id,
                  contact_id: Contact.find(n+1).id,
                  )
end

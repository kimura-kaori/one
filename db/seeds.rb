# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ActionMailer::Base.perform_deliveries = false
#
4.times do |n|
  User.create!(email: "test#{n + 1}@test.com",
               password: 111111,
               admin: false,
               confirmed_at: Time.now
               )
end
User.create(email: "admin@example.com", password: "111111", admin: true, confirmed_at: Time.now)

Student.create!(student_furigana: 'ひの あやみ',
                student_name: '日野彩美',
                sex: '女',
                birthday: '2011年4月8日',
                telephone: '075-123-4567',
                cellphone: '090-9876-5432',
                post_code: '600-0001',
                address: '京都府京都市中京区御所南123',
                parents_furigana: 'ひのかよこ',
                parents_name: '日野香代子',
                relationship: '母',
                user_id: User.find_by(email: 'test1@test.com').id
                )
Student.create!(student_furigana: 'ひのとおる',
                student_name: '日野透',
                sex: '男',
                birthday: '2008年1月8日',
                telephone: '075-123-4567',
                cellphone: '090-9876-5432',
                post_code: '600-0001',
                address: '京都府京都市中京区御所南123',
                parents_furigana: 'ひのかよこ',
                parents_name: '日野香代子',
                relationship: '母',
                user_id: User.find_by(email: 'test1@test.com').id
                )
Student.create!(student_furigana: 'おくのひさの',
                student_name: '奥野久乃',
                sex: '女',
                birthday: '2011年6月8日',
                telephone: '075-674-4567',
                cellphone: '090-1234-5432',
                post_code: '600-0000',
                address: '京都府京都市中京区落合5-68',
                parents_furigana: 'おくのあけみ',
                parents_name: '奥野明美',
                relationship: '母',
                user_id: User.find_by(email: 'test2@test.com').id
                )
Student.create!(student_furigana: 'しまむらそうすけ',
                student_name: '島村宗介',
                sex: '男',
                birthday: '2011年6月11日',
                telephone: '075-674-1234',
                cellphone: '090-5432-6789',
                post_code: '600-0000',
                address: '京都府京都市中京区吉見町十和田山根0-79',
                parents_furigana: 'しまむらただし',
                parents_name: '島村正',
                relationship: '父',
                user_id: User.find_by(email: 'test3@test.com').id
                )
Student.create!(student_furigana: 'たかぞのれい',
                student_name: '高園怜',
                sex: '女',
                birthday: '2011年3月19日',
                telephone: '075-358-1234',
                cellphone: '090-853-6789',
                post_code: '600-0000',
                address: '京都府京都市中京区代官山町1445',
                parents_furigana: 'たかぞのよしき',
                parents_name: '高園芳樹',
                relationship: '父',
                user_id: User.find_by(email: 'test4@test.com').id
                )
Student.create!(student_furigana: 'たかぞのなぎさ',
                student_name: '高園渚',
                sex: '男',
                birthday: '2011年7月19日',
                telephone: '075-358-1234',
                cellphone: '090-853-6789',
                post_code: '600-0000',
                address: '京都府京都市中京区代官山町1445',
                parents_furigana: 'たかぞのよしき',
                parents_name: '高園芳樹',
                relationship: '父',
                user_id: User.find_by(email: 'test4@test.com').id
                )

FamilyEnvironment.create!(relationship: '父',
                          name: '日野輝',
                          birthday: Faker::Date.between(from: '1959-1-1', to: '2001-12-31'),
                          age: 38,
                          family: "会社員",
                          student_id: 1,
                        )
FamilyEnvironment.create!(relationship: '母',
                          name: '日野香代子',
                          birthday: Faker::Date.between(from: '1959-1-1', to: '2001-12-31'),
                          age: 38,
                          family: "会社員",
                          student_id: 1,
                        )
FamilyEnvironment.create!(relationship: '本人',
                          name: '日野彩美',
                          birthday: Faker::Date.between(from: '1959-1-1', to: '2001-12-31'),
                          age: 12,
                          family: "6年2組",
                          student_id: 1,
                        )
FamilyEnvironment.create!(relationship: '弟',
                          name: '日野透',
                          birthday: Faker::Date.between(from: '1959-1-1', to: '2001-12-31'),
                          age: 9,
                          family: "3年2組",
                          student_id: 1,
                        )
FamilyEnvironment.create!(relationship: '父',
                          name: '日野輝',
                          birthday: Faker::Date.between(from: '1959-1-1', to: '2001-12-31'),
                          age: 38,
                          family: "会社員",
                          student_id: 2,
                        )
FamilyEnvironment.create!(relationship: '母',
                          name: '日野香代子',
                          birthday: Faker::Date.between(from: '1959-1-1', to: '2001-12-31'),
                          age: 38,
                          family: "会社員",
                          student_id: 2,
                        )
FamilyEnvironment.create!(relationship: '本人',
                          name: '日野彩美',
                          birthday: Faker::Date.between(from: '1959-1-1', to: '2001-12-31'),
                          age: 12,
                          family: "6年2組",
                          student_id: 2,
                        )
FamilyEnvironment.create!(relationship: '弟',
                          name: '日野透',
                          birthday: Faker::Date.between(from: '1959-1-1', to: '2001-12-31'),
                          age: 9,
                          family: "3年2組",
                          student_id: 2,
                        )
FamilyEnvironment.create!(relationship: '母',
                          name: '奥野明美',
                          birthday: Faker::Date.between(from: '1959-1-1', to: '2001-12-31'),
                          age: 35,
                          family: "会社員",
                          student_id: 3,
                        )
FamilyEnvironment.create!(relationship: '本人',
                          name: '奥野久乃',
                          birthday: Faker::Date.between(from: '1959-1-1', to: '2001-12-31'),
                          age: 9,
                          family: "3年2組",
                          student_id: 3,
                          )
FamilyEnvironment.create!(relationship: '父',
                          name: '島村俊樹',
                          birthday: Faker::Date.between(from: '2011-1-1', to: '2001-12-31'),
                          age: 45,
                          family: "会社員",
                          student_id: 4,
                          )
FamilyEnvironment.create!(relationship: '本人',
                          name: '島村宗介',
                          birthday: Faker::Date.between(from: '2011-1-1', to: '2001-12-31'),
                          age: 12,
                          family: "6年2組",
                          student_id: 4,
                          )
FamilyEnvironment.create!(relationship: '父',
                          name: '高園芳樹',
                          birthday: Faker::Date.between(from: '2011-1-1', to: '2001-12-31'),
                          age: 42,
                          family: "会社員",
                          student_id: 5,
                          )
FamilyEnvironment.create!(relationship: '本人',
                          name: '高園怜',
                          birthday: Faker::Date.between(from: '2011-1-1', to: '2001-12-31'),
                          age: 12,
                          family: "6年2組",
                          student_id: 5,
                          )
FamilyEnvironment.create!(relationship: '兄',
                          name: '高園渚',
                          birthday: Faker::Date.between(from: '2011-1-1', to: '2001-12-31'),
                          age: 12,
                          family: "DIC高校1年1組",
                          student_id: 5,
                          )

EmergencyContact.create!(name: '日野輝',
                           relationship: '父',
                           contact_address: 'DIC株式会社',
                           telephone: '090-2468-1357',
                           student_id: 1,
                           )
EmergencyContact.create!(name: '日野文',
                          relationship: '祖母',
                          contact_address: '祖母宅',
                          telephone: '090-1357-2468',
                          student_id: 1,
                          )
EmergencyContact.create!(name: '日野輝',
                           relationship: '父',
                           contact_address: 'DIC株式会社',
                           telephone: '090-0000-0000',
                           student_id: 2,
                           )
EmergencyContact.create!(name: '日野文',
                          relationship: '祖母',
                          contact_address: '祖母宅',
                          telephone: '090-1234-5678',
                          student_id: 2,
                          )

EmergencyContact.create!(name: '奥野明美',
                          relationship: '母',
                          contact_address: 'SC株式会社',
                          telephone: 075-0000-1234,
                          student_id: 3,
                          )
EmergencyContact.create!(name: '島村俊樹',
                          relationship: '父',
                          contact_address: '株式会社DIV',
                          telephone: 075-1234-0000,
                          student_id: 4,
                          )
EmergencyContact.create!(name: '高園芳樹',
                          relationship: '父',
                          contact_address: '有限会社hoge',
                          telephone: '075-0000-6789',
                          student_id: 5,
                          )
# 5.times do |n|
#   Contact.create!(title: "test#{n + 1}",
#                   user_id: User.find(n+1).id,
#                   )
# end

# 5.times do |n|
#   Comment.create!(content: "sample#{n + 1}",
#                   user_id: User.find(n+1).id,
#                   contact_id: Contact.find(n+1).id,
#                   )
# end

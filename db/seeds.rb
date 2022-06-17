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
                user_id: 1)
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
                user_id: 1)
Student.create!(student_furigana: 'おくのひさの',
                student_name: '奥野久乃',
                sex: '女',
                birthday: '2011年6月8日',
                telephone: '075-674-4567',
                cellphone: '090-1234-5432',
                post_code: '600-0000',
                address: '京都府京都市中京区落合5-68',
                parents_furigana: 'おくのたくや',
                parents_name: '奥野拓也',
                relationship: '父',
                user_id: 2)
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
                user_id: 3)
Student.create!(student_furigana: 'ふくしまゆうき',
                student_name: '福島勇気',
                sex: '男',
                birthday: '2011年12月11日',
                telephone: '075-123-1234',
                cellphone: '090-5432-6789',
                post_code: '600-0000',
                address: '京都府京都市中京区日高町太田9-12',
                parents_furigana: 'ふくしまのぶゆき',
                parents_name: '福島信幸',
                relationship: '父',
                user_id: 4)
Student.create!(student_furigana: 'はやかわしんじ',
                student_name: '早川慎二',
                sex: '男',
                birthday: '2011年8月11日',
                telephone: '075-985-1234',
                cellphone: '090-358-6789',
                post_code: '600-0000',
                address: '京都府京都市中京区日高町太田5-6',
                parents_furigana: 'はやかわたろう',
                parents_name: '早川太郎',
                relationship: '父',
                user_id: 5)
Student.create!(student_furigana: 'はやかわさき',
                student_name: '早川咲',
                sex: '女',
                birthday: '2004年12月11日',
                telephone: '075-985-1234',
                cellphone: '090-358-6789',
                post_code: '600-0000',
                address: '京都府京都市中京区日高町太田5-6',
                parents_furigana: 'はやかわたろう',
                parents_name: '早川太郎',
                relationship: '父',
                user_id: 5)
Student.create!(student_furigana: 'はやかわそう',
                student_name: '早川奏',
                sex: '男',
                birthday: '2005年10月1日',
                telephone: '075-985-1234',
                cellphone: '090-358-6789',
                post_code: '600-0000',
                address: '京都府京都市中京区日高町太田5-6',
                parents_furigana: 'はやかわたろう',
                parents_name: '早川太郎',
                relationship: '父',
                user_id: 5)
Student.create!(student_furigana: 'おがたもとよ',
                student_name: '尾形素美',
                sex: '女',
                birthday: '2011年3月19日',
                telephone: '075-358-1234',
                cellphone: '090-853-6789',
                post_code: '600-0000',
                address: '京都府京都市中京区上勝町1445',
                parents_furigana: 'おがたあきひろ',
                parents_name: '尾形明宏',
                relationship: '父',
                user_id: 6)
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
                user_id: 7)
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
                user_id: 7)

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
#
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

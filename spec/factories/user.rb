FactoryBot.define do
  factory :admin_user, class: User do
    email { "admin@admin.com" }
    password { '111111' }
    admin { "true" }
  end

  factory :user1, class: User do
    email { "normal1@normal.com" }
    password { '111111' }
    admin { "false" }
  end

  factory :user2, class: User do
    email { "normal2@normal.com" }
    password { '111111' }
    admin { "false" }
  end

  factory :student, class: Student do
    student_furigana { "やまだたろう" }
    student_name { "山田太郎" }
    sex { '男' }
    birthday { '2011-11-23' }
    telephone { "077-1234-5678" }
    cellphone { "090-1234-5678" }
    post_code { "600-0000" }
    address { "京都府京都市中京区烏丸御池123" }
    parents_furigana { "やまだきょうこ" }
    parents_name { "山田京子" }
    relationship { "母" }
    user_id { User.find_by(email: 'normal1@normal.com').id}
  end

  factory :student2, class: Student do
    student_furigana { "さとうはなこ" }
    student_name { "佐藤花子" }
    sex { '女' }
    birthday { '2011-11-23' }
    telephone { "077-1234-5678" }
    cellphone { "090-1234-5678" }
    post_code { "600-0000" }
    address { "京都府京都市中京区烏丸御池321" }
    parents_furigana { "さとうこういち" }
    parents_name { "佐藤浩一" }
    relationship { "父" }
    user_id { User.find_by(email: 'normal2@normal.com').id}
  end

  factory :family_environment1, class: FamilyEnvironment do
    relationship { "母" }
    name { '山田京子' }
    birthday { '1980-11-23' }
    age { '40' }
    family { '会社員' }
    student_id { Student.find_by(student_furigana: "やまだたろう").id }
  end

  factory :family_environment2, class: FamilyEnvironment do
    relationship { "父" }
    name { '佐藤正' }
    birthday { '1980-11-23' }
    age { '40' }
    family { '自営業' }
    student_id { Student.find_by(student_furigana: "さとうはなこ").id }
  end

  factory :emergency_contact1, class: EmergencyContact do
    name { '山田京子' }
    relationship { "母" }
    contact_address { 'DIC株式会社' }
    telephone { '090-0000-0000' }
    student_id { Student.find_by(student_furigana: "やまだたろう").id }
  end

  factory :emergency_contact2, class: EmergencyContact do
    name { '佐藤正' }
    relationship { "父" }
    contact_address { '有限会社DIC' }
    telephone { '090-0000-0000' }
    student_id { Student.find_by(student_furigana: "さとうはなこ").id }
  end
end

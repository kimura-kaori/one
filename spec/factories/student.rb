FactoryBot.define do
  factory :student, class: Student do
    id { 1 }
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
  end
end

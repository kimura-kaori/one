FactoryBot.define do
  factory :admin_user, class: User do
    id { 1 }
    email { "admin@admin.com" }
    password { '111111' }
    password_confirmation { '111111' }
    admin { "true" }
  end

  factory :user1, class: User do
    id { 2 }
    email { "normal1@normal.com" }
    password { '111111' }
    admin { "false" }
  end

  factory :user2, class: User do
    id { 3 }
    email { "normal2@normal.com" }
    password { '111111' }
    password_confirmation { '111111' }
    admin { "false" }
  end
end

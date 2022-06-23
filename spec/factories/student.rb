FactoryBot.define do

  factory :admin_user, class: User do
    id { 1 }
    name { "管理者" }
    email { "admin@admin.com" }
    password { '123456' }
    password_confirmation { '123456' }
    admin { "true" }
  end
end  

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { 'abc12345' }
    password_confirmation { 'abc12345' }
    first_name_kana { 'タロウ' }
    last_name_kana { 'ヤマダ' }
    first_name { '太ろウ' }
    last_name { 'やマ田' }
    birthday { '2000-01-01' }
  end
end

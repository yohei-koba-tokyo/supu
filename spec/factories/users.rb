FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { "00000000" }
    password_confirmation { "00000000" }
  end
end

FactoryBot.define do
  factory :friend do
    sex                   { 1 }
    birth                 { Faker::Date.between(from: Date.today - 1000, to: Date.today - 700) }
    twitter               { "legrobeats" }
    memo                  { "テストメモです^^" }
    name                  { Faker::Name.last_name }
    user
  end
end

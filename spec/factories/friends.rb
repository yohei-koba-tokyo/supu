FactoryBot.define do

  factory :friend do
    sex                   {1}
    birth                 {"1982-10-20"}
    twitter               {"legrobeats"}
    memo                  {"テストメモです^^"}
    name                  {"naoko"}
    association :user
  end

end
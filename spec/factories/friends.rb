FactoryBot.define do

  factory :friend do
    user_id               {"1"}
    sex                   {1}
    birth                 {1982-10-20}
    twitter               {"legrobeats"}
    memo                  {"テストメモです^^"}
    name                  {"naoko"}
  end

end
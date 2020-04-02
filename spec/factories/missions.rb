FactoryBot.define do

  factory :mission do
    name                  {"誕生日お祝いサプライズ！"}
    datetime              {Date.today + 10}
    comment               {"thanks, always as ever!"}
    mission_type          {2}
    friend
  end

end
FactoryBot.define do
  factory :message do
    content               { "Love and peace yo!" }
    image                 { File.open("#{Rails.root}/public/images/test_image.png") }
    mission
    user
  end
end

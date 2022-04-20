FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    sex { Faker::Number.within(range: 0..1)}
    personal_color { Faker::Number.between(from: 0, to: 3)}
    skin_quality { Faker::Number.between(from: 0, to: 3)}
    introduction { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
  end
end
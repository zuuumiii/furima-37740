FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { "1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"田中"}
    last_name             {"リチャード"}
    first_name_kana       {"タナカ"}
    last_name_kana        {"リチャード"}
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end

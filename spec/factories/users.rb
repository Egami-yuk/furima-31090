FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Name.initials}
    family_name           {"山田"}
    first_name            {"山本"}
    family_name_kana      {"ヤマダ"}
    first_name_kana       {"ヤマモト"}
    birthday              {"2002-02-02"}
  end
end
FactoryBot.define do
  factory :order_address do
    token         {Faker::Lorem.sentence}
    postal_code   {"111-1111"}
    prefecture_id {"2"}
    city          {"横浜市"}
    address       {"青山"}
    building      {"111"}
    phone_number  {"11111111111"}
  end
end
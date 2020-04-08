FactoryBot.define do
  factory :address do
    postal_code   {"000-0000"}
    prefecture_id {1}
    city          {"市"}
    street        {"番地"}
    building      {"ビル"}
    phone         {"000-1234-5678"}
  end
end
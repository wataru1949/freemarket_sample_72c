FactoryBot.define do
  factory :card do
    user_id { 1 }
    customer_id { "cus_1234567890abcdefghijklmnopqr" }
    card_id { "car_1234567890abcdefghijklmnopqr" }
  end
end

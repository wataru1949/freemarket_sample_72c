FactoryBot.define do
  factory :item_image do
    image           {File.open("#{Rails.root}/public/uploads/item_image/image/1/1.jpeg")}
    item_id         {2}
  end
end